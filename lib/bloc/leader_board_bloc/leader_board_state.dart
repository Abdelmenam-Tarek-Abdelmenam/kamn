part of 'leader_board_bloc.dart';

class LeaderBoardState extends Equatable {
  final List<Player> topRanked;
  final List<Player> bottomRanked;
  final BlocStatus status;
  const LeaderBoardState(
      {required this.topRanked,
      required this.bottomRanked,
      required this.status});

  factory LeaderBoardState.initial() => LeaderBoardState(
      topRanked: List.generate(3, (index) => Player.empty()),
      bottomRanked: const [],
      status: BlocStatus.idle);

  LeaderBoardState copyWith(
          {List<Player>? topRanked,
          List<Player>? bottomRanked,
          BlocStatus? status}) =>
      LeaderBoardState(
        status: status ?? this.status,
        topRanked: topRanked ?? this.topRanked,
        bottomRanked: bottomRanked ?? this.bottomRanked,
      );

  @override
  List<Object?> get props => [topRanked.length, bottomRanked.length, status];
}
