part of 'matches_bloc.dart';

class PlayState extends Equatable {
  final MatchesViewType type;
  final BlocStatus groundStatus;
  final BlocStatus matchesStatus;
  final ShowData<Ground> grounds;
  final ShowData<ActiveMatch> matches;
  final FreeGames? userAvailable;

  const PlayState({
    required this.type,
    required this.grounds,
    required this.matches,
    this.userAvailable,
    required this.groundStatus,
    required this.matchesStatus,
  });

  factory PlayState.initial() => PlayState(
        type: MatchesViewType.grounds,
        grounds: ShowData.empty(),
        matches: ShowData.empty(),
        matchesStatus: BlocStatus.idle,
        groundStatus: BlocStatus.idle,
      );

  PlayState copyWith({
    MatchesViewType? type,
    ShowData<Ground>? grounds,
    FreeGames? userAvailable,
    ShowData<ActiveMatch>? matches,
    BlocStatus? groundStatus,
    BlocStatus? matchesStatus,
    bool? forceNull,
  }) {
    return PlayState(
      type: type ?? this.type,
      userAvailable: forceNull == null
          ? userAvailable ?? this.userAvailable
          : userAvailable,
      grounds: grounds ?? this.grounds,
      matches: matches ?? this.matches,
      matchesStatus: matchesStatus ?? this.groundStatus,
      groundStatus: groundStatus ?? this.groundStatus,
    );
  }

  @override
  List<Object?> get props => [type, userAvailable, matchesStatus, groundStatus];
}

enum MatchesViewType {
  grounds,
  active,
  community;

  @override
  String toString() {
    switch (this) {
      case MatchesViewType.grounds:
        return StringManger.ground;
      case MatchesViewType.active:
        return StringManger.active;
      case MatchesViewType.community:
        return StringManger.community;
    }
  }

  IconData toIcon() {
    switch (this) {
      case MatchesViewType.grounds:
        return FontAwesomeIcons.mapLocationDot;
      case MatchesViewType.active:
        return FontAwesomeIcons.peopleGroup;
      case MatchesViewType.community:
        return Icons.chat;
    }
  }
}

enum FreeGames {
  basketball,
  football,
  volleyball;

  @override
  String toString() {
    switch (this) {
      case FreeGames.basketball:
        return StringManger.basketball;
      case FreeGames.football:
        return StringManger.football;
      case FreeGames.volleyball:
        return StringManger.volleyball;
    }
  }
}
