import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:kamn/bloc/status.dart';
import 'package:kamn/data/models/show_data.dart';
import 'package:kamn/data/repository_implementer/tournament_repo.dart';

import '../../data/models/tournament.dart';
import '../../data/repository_implementer/error_state.dart';

part 'tournament_event.dart';
part 'tournament_state.dart';

class TournamentBloc extends Bloc<TournamentEvent, TournamentState> {
  TournamentBloc() : super(TournamentState.initial()) {
    on<GetTournamentEvent>(_getDataHandler);
    on<GetMoreTournamentEvent>(_getMoreDataHandler);
    add(const GetTournamentEvent());
  }
  final TournamentRepository _repository = TournamentRepository();

  Future<void> _getDataHandler(GetTournamentEvent _, Emitter emit) async {
    emit(state.copyWith(status: BlocStatus.gettingData));
    Either<Failure, AllTournament> all =
        await _repository.getAllStore(state.other.end);
    all.fold(
        (_) => emit(state.copyWith(status: BlocStatus.error)),
        (data) => emit(state.copyWith(
            status: BlocStatus.getData,
            other: data.other,
            active: data.active)));
  }

  Future<void> _getMoreDataHandler(
      GetMoreTournamentEvent _, Emitter emit) async {
    emit(state.copyWith(status: BlocStatus.idle));
    if (state.other.isEnd) return;
    if (state.status == BlocStatus.gettingData) return;

    emit(state.copyWith(status: BlocStatus.idle));
    Either<Failure, ShowData<Tournament>> all =
        await _repository.getMoreStore(state.other);
    all.fold(
        (err) => err.show,
        (data) => emit(state.copyWith(
              status: BlocStatus.getData,
              other: data,
            )));
  }
}
