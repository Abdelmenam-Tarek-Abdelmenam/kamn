part of 'leader_board_bloc.dart';

abstract class LeaderBoardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetBoardsEvent extends LeaderBoardEvent {}
