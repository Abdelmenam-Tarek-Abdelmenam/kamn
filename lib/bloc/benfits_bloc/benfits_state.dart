part of 'benfits_bloc.dart';

class BenfitsState extends Equatable {
  final BenfitsViewType type;
  final BlocStatus status;
  final DoctorType filter;
  final ShowData<OtherBenfits> sportBenefits;
  final ShowData<MedicalBenefit> medicalBenefits;
  final ShowData<OtherBenfits> nutritionBenefits;

  ShowData<Benefit> get benfits => {
        BenfitsViewType.medical: medicalBenefits,
        BenfitsViewType.sport: sportBenefits,
        BenfitsViewType.nutrition: nutritionBenefits
      }[type]!;

  const BenfitsState(
      {required this.type,
      required this.filter,
      required this.medicalBenefits,
      required this.sportBenefits,
      required this.status,
      required this.nutritionBenefits});

  factory BenfitsState.initial() => BenfitsState(
      type: BenfitsViewType.medical,
      status: BlocStatus.idle,
      filter: DoctorType.all,
      medicalBenefits: ShowData.empty(),
      sportBenefits: ShowData.empty(),
      nutritionBenefits: ShowData.empty());

  BenfitsState copyWith(
      {BenfitsViewType? type,
      DoctorType? filter,
      ShowData? benfits,
      ShowData<OtherBenfits>? sportBenefits,
      ShowData<OtherBenfits>? nutritionBenefits,
      BlocStatus? status,
      ShowData<MedicalBenefit>? medicalBenefits}) {
    if (benfits != null) {
      switch (this.type) {
        case BenfitsViewType.medical:
          medicalBenefits = ShowData(List<MedicalBenefit>.from(benfits.data),
              end: benfits.end);
          break;
        case BenfitsViewType.nutrition:
          nutritionBenefits =
              ShowData(List<OtherBenfits>.from(benfits.data), end: benfits.end);
          break;
        case BenfitsViewType.sport:
          sportBenefits =
              ShowData(List<OtherBenfits>.from(benfits.data), end: benfits.end);
          break;
      }
    }
    return BenfitsState(
        filter: filter ?? this.filter,
        type: type ?? this.type,
        status: status ?? this.status,
        sportBenefits: sportBenefits ?? this.sportBenefits,
        nutritionBenefits: nutritionBenefits ?? this.nutritionBenefits,
        medicalBenefits: medicalBenefits ?? this.medicalBenefits);
  }

  @override
  List<Object> get props =>
      [type, filter, medicalBenefits.length, sportBenefits.length, status];
}

enum BenfitsViewType {
  medical,
  nutrition,
  sport;

  @override
  String toString() {
    switch (this) {
      case BenfitsViewType.sport:
        return StringManger.sport;
      case BenfitsViewType.medical:
        return StringManger.medical;
      case BenfitsViewType.nutrition:
        return StringManger.nutrition;
    }
  }

  IconData toIcon() {
    switch (this) {
      case BenfitsViewType.sport:
        return FontAwesomeIcons.personRunning;
      case BenfitsViewType.medical:
        return FontAwesomeIcons.userDoctor;
      case BenfitsViewType.nutrition:
        return Icons.fastfood_outlined;
    }
  }
}
