part of 'matches_bloc.dart';

class MatchesState extends Equatable {
  final MatchesViewType type;
  final List<Ground> grounds;
  final List<ActiveMatch> matches;
  final bool userAvailable;

  const MatchesState({
    required this.type,
    required this.grounds,
    required this.matches,
    required this.userAvailable,
  });

  factory MatchesState.initial() => const MatchesState(
        type: MatchesViewType.grounds,
        userAvailable: false,
        grounds: [],
        matches: [],
      );

  MatchesState copyWith({
    MatchesViewType? type,
    List<Ground>? grounds,
    bool? userAvailable,
    List<ActiveMatch>? matches,
  }) {
    return MatchesState(
      type: type ?? this.type,
      userAvailable: userAvailable ?? this.userAvailable,
      grounds: grounds ?? this.grounds,
      matches: matches ?? this.matches,
    );
  }

  @override
  List<Object> get props => [type, userAvailable];
}

enum MatchesViewType {
  grounds,
  active;

  @override
  String toString() {
    switch (this) {
      case MatchesViewType.grounds:
        return StringManger.ground;
      case MatchesViewType.active:
        return StringManger.active;
    }
  }

  IconData toIcon() {
    switch (this) {
      case MatchesViewType.grounds:
        return FontAwesomeIcons.futbol;
      case MatchesViewType.active:
        return FontAwesomeIcons.peopleGroup;
    }
  }
}
