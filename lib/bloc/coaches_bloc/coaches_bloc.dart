import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamn/data/models/app_user.dart';
import 'package:kamn/data/models/coach.dart';
import 'package:kamn/data/models/gym.dart';

import '../../presentation/resources/string_manager.dart';

part 'coaches_event.dart';
part 'coaches_state.dart';

class CoachesBloc extends Bloc<CoachesEvent, CoachesState> {
  CoachesBloc() : super(CoachesState.initial()) {
    on<ChangeViewTypeEvent>(_changeViewTypeHandler);
    on<ChangeViewFilterEvent>(_changeViewFilterHandler);
  }

  void _changeViewTypeHandler(ChangeViewTypeEvent event, Emitter emit) =>
      emit(state.copyWith(type: event.type));

  void _changeViewFilterHandler(ChangeViewFilterEvent event, Emitter emit) =>
      emit(state.copyWith(filter: event.filter));
}
