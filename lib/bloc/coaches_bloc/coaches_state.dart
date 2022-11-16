part of 'coaches_bloc.dart';

class CoachesState extends Equatable {
  final CoachesType type;
  final Games filter;
  final List<Coach> coaches;
  final List<Gym> gyms;

  const CoachesState(
      {required this.type,
      required this.filter,
      required this.coaches,
      required this.gyms});

  factory CoachesState.initial() => const CoachesState(
      type: CoachesType.coach, filter: Games.all, coaches: [], gyms: []);

  CoachesState copyWith(
      {CoachesType? type,
      Games? filter,
      List<Coach>? coaches,
      List<Gym>? gyms}) {
    return CoachesState(
        filter: filter ?? this.filter,
        type: type ?? this.type,
        coaches: coaches ?? this.coaches,
        gyms: gyms ?? this.gyms);
  }

  @override
  List<Object> get props => [type, filter, coaches.length, gyms.length];
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
