part of 'benfits_bloc.dart';

abstract class BenfitsEvent extends Equatable {
  const BenfitsEvent();

  @override
  List<Object> get props => [];
}

class ChangeViewTypeEvent extends BenfitsEvent {
  final BenfitsViewType type;
  const ChangeViewTypeEvent(this.type);

  @override
  List<Object> get props => [type];
}

class ChangeViewFilterEvent extends BenfitsEvent {
  final DoctorType filter;
  const ChangeViewFilterEvent(this.filter);

  @override
  List<Object> get props => [filter];
}

class GetBenefitData extends BenfitsEvent {
  final String model;
  const GetBenefitData(this.model);
  @override
  List<Object> get props => [model];
}
