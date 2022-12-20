import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamn/bloc/status.dart';
import 'package:kamn/data/models/show_data.dart';

import '../../data/models/benfits.dart';
import '../../domain_layer/repository_implementer/benefits_repo.dart';
import '../../domain_layer/repository_implementer/error_state.dart';
import '../../presentation/resources/string_manager.dart';

part 'benfits_event.dart';
part 'benfits_state.dart';

class BenfitsBloc extends Bloc<BenfitsEvent, BenfitsState> {
  BenfitsBloc() : super(BenfitsState.initial()) {
    on<ChangeViewTypeEvent>(_changeViewTypeHandler);
    on<ChangeViewFilterEvent>(_changeViewFilterHandler);
    on<GetBenefitData>(_getSportDataHandler);

    add(const GetBenefitData(medicalModel));
  }

  final BenefitsRepository _repository = BenefitsRepository();

  Future<void> _getSportDataHandler(GetBenefitData event, Emitter emit) async {
    emit(state.copyWith(status: BlocStatus.gettingData));
    Either<Failure, ShowData<Benefit>> all =
        await _repository.getAllBenefits(state.benfits.end, event.model);
    all.fold(
        (_) => emit(state.copyWith(status: BlocStatus.error)),
        (data) => emit(state.copyWith(
              status: BlocStatus.getData,
              benfits: data,
            )));
  }

  void _changeViewFilterHandler(ChangeViewFilterEvent event, Emitter emit) =>
      emit(state.copyWith(filter: event.filter));

  void _changeViewTypeHandler(ChangeViewTypeEvent event, Emitter emit) {
    emit(state.copyWith(type: event.type));
    if (event.type == BenfitsViewType.medical &&
        state.benfits.isEmpty &&
        state.status != BlocStatus.gettingData) {
      add(const GetBenefitData(medicalModel));
    } else if (event.type == BenfitsViewType.nutrition &&
        state.benfits.isEmpty &&
        state.status != BlocStatus.gettingData) {
      add(const GetBenefitData(nutritionModel));
    } else if (event.type == BenfitsViewType.sport &&
        state.benfits.isEmpty &&
        state.status != BlocStatus.gettingData) {
      add(const GetBenefitData(sportsModel));
    }
  }
}
