import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamn/data/models/app_user.dart';
import 'package:kamn/data/models/matches.dart';

import '../../presentation/resources/string_manager.dart';

part 'matches_event.dart';
part 'matches_state.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  MatchesBloc() : super(MatchesState.initial()) {
    on<ChangeViewTypeEvent>(_changeViewTypeHandler);
    on<ChangeUserCheckEvent>(_changeUserCheckHandler);
  }

  void _changeViewTypeHandler(ChangeViewTypeEvent event, Emitter emit) =>
      emit(state.copyWith(type: event.type));

  void _changeUserCheckHandler(ChangeUserCheckEvent event, Emitter emit) =>
      emit(state.copyWith(userAvailable: event.state));
}
