import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamn/bloc/status.dart';
import 'package:kamn/data/models/app_user.dart';
import 'package:kamn/data/models/coach.dart';
import 'package:kamn/data/models/gym.dart';
import 'package:kamn/data/models/show_data.dart';

import '../../domain_layer/repository_implementer/coaches_repo.dart';
import '../../domain_layer/repository_implementer/error_state.dart';
import '../../presentation/resources/string_manager.dart';

part 'coaches_event.dart';
part 'coaches_state.dart';

class CoachesBloc extends Bloc<CoachesEvent, CoachesState> {
  CoachesBloc() : super(CoachesState.initial()) {
    on<ChangeViewTypeEvent>(_changeViewTypeHandler);
    on<ChangeViewFilterEvent>(_changeViewFilterHandler);
    on<GetStartDataEvent>(_getStartDataHandler);
    on<GetGymsEvent>(_getGymsEventHandler);
    on<GetCoachesEvent>(_getCoachesEventHandler);

    add(const GetStartDataEvent());
  }
  final CoachesRepository _repository = CoachesRepository();

  Future<void> _changeViewTypeHandler(
      ChangeViewTypeEvent event, Emitter emit) async {
    emit(state.copyWith(type: event.type));

    if (event.type == CoachesType.coach &&
        state.coaches.isEmpty &&
        state.coachesStatus != BlocStatus.gettingData) {
      await _getCoachesFirstData(emit);
    } else if (event.type == CoachesType.gym &&
        state.gyms.isEmpty &&
        state.gymStatus != BlocStatus.gettingData) {
      await _getGymsFirstData(emit);
    }
  }

  void _changeViewFilterHandler(ChangeViewFilterEvent event, Emitter emit) =>
      emit(state.copyWith(filter: event.filter));

  Future<void> _getStartDataHandler(GetStartDataEvent _, Emitter emit) async {
    await _getCoachesFirstData(emit);
  }

  Future<void> _getCoachesFirstData(Emitter emit) async {
    emit(state.copyWith(coachesStatus: BlocStatus.gettingData));
    Either<Failure, ShowData<Coach>> all =
        await _repository.getAllCoaches(state.coaches.end);
    all.fold(
        (_) => emit(state.copyWith(coachesStatus: BlocStatus.error)),
        (data) => emit(state.copyWith(
              coachesStatus: BlocStatus.getData,
              coaches: data,
            )));
  }

  Future<void> _getGymsFirstData(Emitter emit) async {
    emit(state.copyWith(gymStatus: BlocStatus.gettingData));
    Either<Failure, ShowData<Gym>> all =
        await _repository.getAllGyms(state.gyms.end);
    all.fold((_) {
      emit(state.copyWith(gymStatus: BlocStatus.error));
    },
        (data) => emit(state.copyWith(
              gymStatus: BlocStatus.getData,
              gyms: data,
            )));
  }

  void _getCoachesEventHandler(GetCoachesEvent _, Emitter emit) =>
      _getCoachesFirstData(emit);

  void _getGymsEventHandler(GetGymsEvent _, Emitter emit) =>
      _getGymsFirstData(emit);
}
