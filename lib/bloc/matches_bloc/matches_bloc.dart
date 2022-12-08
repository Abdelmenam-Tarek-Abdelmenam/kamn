import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamn/bloc/status.dart';
import 'package:kamn/data/models/matches.dart';
import 'package:kamn/data/models/show_data.dart';
import 'package:kamn/data/repository_implementer/play_repo.dart';

import '../../data/repository_implementer/error_state.dart';
import '../../presentation/resources/string_manager.dart';

part 'matches_event.dart';
part 'matches_state.dart';

class PlayBloc extends Bloc<PlayEvent, PlayState> {
  PlayBloc() : super(PlayState.initial()) {
    on<ChangeViewTypeEvent>(_changeViewTypeHandler);
    on<ChangeUserCheckEvent>(_changeUserCheckHandler);
    on<GetStartDataEvent>(_getStartDataHandler);

    add(const GetStartDataEvent());
  }
  final PlayRepository _repository = PlayRepository();

  Future<void> _changeViewTypeHandler(
      ChangeViewTypeEvent event, Emitter emit) async {
    emit(state.copyWith(type: event.type));
    if (event.type == MatchesViewType.grounds &&
        state.matches.isEmpty &&
        state.matchesStatus != BlocStatus.gettingData) {
      await _getGroundsFirstData(emit);
    } else if (event.type == MatchesViewType.active &&
        state.matches.isEmpty &&
        state.matchesStatus != BlocStatus.gettingData) {
      await _getMatchesFirstData(emit);
    }
  }

  Future<void> _changeUserCheckHandler(
      ChangeUserCheckEvent event, Emitter emit) async {
    bool eventState = !state.userAvailable;
    Either<Failure, void> value =
        await _repository.setUserAvailable(eventState);
    value.fold((left) => left.show,
        (right) => emit(state.copyWith(userAvailable: eventState)));
  }

  Future<void> _getStartDataHandler(GetStartDataEvent _, Emitter emit) async {
    emit(state.copyWith(matchesStatus: BlocStatus.gettingData));
    Either<Failure, bool?> value = await _repository.getUserAvailable();
    value.fold((left) => left.show,
        (right) => emit(state.copyWith(userAvailable: right)));
    await _getGroundsFirstData(emit);
  }

  Future<void> _getGroundsFirstData(Emitter emit) async {
    emit(state.copyWith(groundStatus: BlocStatus.gettingData));
    Either<Failure, ShowData<Ground>> all =
        await _repository.getAllGrounds(state.grounds.end);
    all.fold(
        (_) => emit(state.copyWith(groundStatus: BlocStatus.error)),
        (data) => emit(state.copyWith(
              groundStatus: BlocStatus.getData,
              grounds: data,
            )));
  }

  Future<void> _getMatchesFirstData(Emitter emit) async {
    emit(state.copyWith(matchesStatus: BlocStatus.gettingData));
    Either<Failure, ShowData<ActiveMatch>> all =
        await _repository.getAllMatches(state.matches.end);
    all.fold(
        (_) => emit(state.copyWith(matchesStatus: BlocStatus.error)),
        (data) => emit(state.copyWith(
              matchesStatus: BlocStatus.getData,
              matches: data,
            )));
  }
}
