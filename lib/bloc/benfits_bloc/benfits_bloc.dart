import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/models/benfits.dart';
import '../../presentation/resources/string_manager.dart';

part 'benfits_event.dart';
part 'benfits_state.dart';

class BenfitsBloc extends Bloc<BenfitsEvent, BenfitsState> {
  BenfitsBloc() : super(BenfitsState.initial()) {
    on<ChangeViewTypeEvent>(_changeViewTypeHandler);
    on<ChangeViewFilterEvent>(_changeViewFilterHandler);
  }

  void _changeViewTypeHandler(ChangeViewTypeEvent event, Emitter emit) =>
      emit(state.copyWith(type: event.type));

  void _changeViewFilterHandler(ChangeViewFilterEvent event, Emitter emit) =>
      emit(state.copyWith(filter: event.filter));
}
