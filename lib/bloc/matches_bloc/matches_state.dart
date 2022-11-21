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

  factory MatchesState.initial() => MatchesState(
        type: MatchesViewType.grounds,
        userAvailable: false,
        grounds: [
          Ground(
              name: "OLympic  playground",
              address: "Ahmed Zewail Sq., Somouha - Alexandria - Egypt",
              price: 120,
              img: testImage1,
              type: Games.football,
              rating: 3.5)
        ],
        matches: [
          ActiveMatch(
              game: Games.basketball,
              playGroundName: "Smouha Clup",
              availableCount: 3,
              time: "22/11/2022 3:40 PM"),
          ActiveMatch(
              game: Games.football,
              playGroundName: "falky Playground",
              availableCount: 2,
              time: "23/11/2022 7:80 PM")
        ],
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
        return FontAwesomeIcons.personRunning;
      case MatchesViewType.active:
        return FontAwesomeIcons.peopleGroup;
    }
  }
}
