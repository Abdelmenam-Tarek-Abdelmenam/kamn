part of 'matches_bloc.dart';

abstract class MatchesEvent extends Equatable {
  const MatchesEvent();
}

class ChangeViewTypeEvent extends MatchesEvent {
  final MatchesViewType type;
  const ChangeViewTypeEvent(this.type);

  @override
  List<Object> get props => [type];
}

class ChangeUserCheckEvent extends MatchesEvent {
  final bool state;
  const ChangeUserCheckEvent(this.state);

  @override
  List<Object> get props => [state];
}
