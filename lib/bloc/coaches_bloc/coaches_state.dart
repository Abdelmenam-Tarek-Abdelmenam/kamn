part of 'coaches_bloc.dart';

class CoachesState extends Equatable {
  final CoachesType type;
  final Games filter;
  final ShowData<Coach> coaches;
  final ShowData<Gym> gyms;
  final BlocStatus coachesStatus;
  final BlocStatus gymStatus;

  const CoachesState({
    required this.type,
    required this.filter,
    required this.coaches,
    required this.gyms,
    required this.coachesStatus,
    required this.gymStatus,
  });

  factory CoachesState.initial() => CoachesState(
        type: CoachesType.coach,
        filter: Games.all,
        coaches: ShowData.empty(),
        gyms: ShowData.empty(),
        coachesStatus: BlocStatus.idle,
        gymStatus: BlocStatus.idle,
      );

  CoachesState copyWith({
    CoachesType? type,
    Games? filter,
    ShowData<Coach>? coaches,
    ShowData<Gym>? gyms,
    BlocStatus? coachesStatus,
    BlocStatus? gymStatus,
  }) {
    return CoachesState(
      filter: filter ?? this.filter,
      type: type ?? this.type,
      coaches: coaches ?? this.coaches,
      gyms: gyms ?? this.gyms,
      coachesStatus: coachesStatus ?? this.coachesStatus,
      gymStatus: gymStatus ?? this.gymStatus,
    );
  }

  @override
  List<Object> get props =>
      [type, filter, coaches.length, gyms.length, coachesStatus, gymStatus];
}

enum CoachesType {
  coach,
  gym;

  @override
  String toString() {
    switch (this) {
      case CoachesType.coach:
        return StringManger.coach;
      case CoachesType.gym:
        return StringManger.gym;
    }
  }

  IconData toIcon() {
    switch (this) {
      case CoachesType.coach:
        return FontAwesomeIcons.handshakeAngle;
      case CoachesType.gym:
        return FontAwesomeIcons.dumbbell;
    }
  }
}
