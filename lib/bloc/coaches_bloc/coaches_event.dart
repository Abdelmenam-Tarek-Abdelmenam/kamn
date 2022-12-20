part of 'coaches_bloc.dart';

abstract class CoachesEvent extends Equatable {
  const CoachesEvent();

  @override
  List<Object> get props => [];
}

class ChangeViewTypeEvent extends CoachesEvent {
  final CoachesType type;
  const ChangeViewTypeEvent(this.type);

  @override
  List<Object> get props => [type];
}

class ChangeViewFilterEvent extends CoachesEvent {
  final Games filter;
  const ChangeViewFilterEvent(this.filter);

  @override
  List<Object> get props => [filter];
}

class GetStartDataEvent extends CoachesEvent {
  const GetStartDataEvent();
}

class GetCoachesEvent extends CoachesEvent {
  const GetCoachesEvent();
}

class GetGymsEvent extends CoachesEvent {
  const GetGymsEvent();
}
