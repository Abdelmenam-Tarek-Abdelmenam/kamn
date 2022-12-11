import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/ranked_user.dart';
import '../../domain_layer/repository_implementer/error_state.dart';
import '../../domain_layer/repository_implementer/ranked_user_repo.dart';
import '../status.dart';

part 'leader_board_event.dart';
part 'leader_board_state.dart';

class LeaderBoardBloc extends Bloc<LeaderBoardEvent, LeaderBoardState> {
  LeaderBoardBloc() : super(LeaderBoardState.initial()) {
    on<GetBoardsEvent>(_getDataHandler);
    add(GetBoardsEvent());
  }

  final RankedUserRepository _repository = RankedUserRepository();

  Future<void> _getDataHandler(GetBoardsEvent _, Emitter emit) async {
    emit(state.copyWith(status: BlocStatus.gettingData));
    Either<Failure, AllRanked> all = await _repository.getAllRanked();
    all.fold(
        (_) => emit(state.copyWith(status: BlocStatus.error)),
        (data) => emit(state.copyWith(
            status: BlocStatus.getData,
            bottomRanked: data.bottomRanked,
            topRanked: data.topRanked)));
  }
}
