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

  factory CoachesState.initial() =>
      CoachesState(type: CoachesType.coach, filter: Games.all, coaches: [
        Coach(
            name: "Sama",
            id: "55",
            description: "Fitness trainer",
            img: testImg1,
            price: 120,
            position: "Fitness trainer",
            rating: 2.5,
            game: Games.gym),
        Coach(
            name: "Ahmed Mohamed",
            id: "55",
            description: "Swimming",
            img: testImg2,
            price: 10,
            rating: 4.75,
            position: "Padel trainer",
            game: Games.tennis)
      ], gyms: [
        Gym(
            name: "Golden Gym",
            address: "22 AboQir street,Alexandria Egypt",
            price: 1200,
            img: testImage1,
            type: GymType.mix,
            rating: 4.25),
        Gym(
            name: "VIP Gym",
            address: "11 Elrasafa st  moharem bek",
            price: 800,
            img: testImage2,
            type: GymType.separate,
            rating: 3)
      ]);

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
