part of 'benfits_bloc.dart';

class BenfitsState extends Equatable {
  final BenfitsViewType type;
  final DoctorType filter;
  final List<SportBenefit> sportBenefits;
  final List<MedicalBenefit> medicalBenefits;
  const BenfitsState(
      {required this.type,
      required this.filter,
      required this.medicalBenefits,
      required this.sportBenefits});

  factory BenfitsState.initial() => BenfitsState(
          type: BenfitsViewType.medical,
          filter: DoctorType.all,
          medicalBenefits: [
            MedicalBenefit(
                id: "a",
                name: "Abdelmenam",
                benefit: "50%",
                description: "description",
                img: testImage1,
                type: DoctorType.orthopedist),
            MedicalBenefit(
                id: "b",
                name: "Yasmeen",
                benefit: "free",
                description: "description",
                img: testImage2,
                type: DoctorType.physiotherapist),
          ],
          sportBenefits: [
            SportBenefit(
                goods: "Shoes",
                id: "c",
                name: "Adidas",
                benefit: "30%",
                description: "description",
                img:
                    "https://www.akropoleriga.lv/image/15622466113155_430_430_1.jpg"),
            SportBenefit(
                goods: "T-Shirts",
                id: "d",
                name: "Nike",
                benefit: "free shipping",
                description: "description",
                img:
                    "https://static.nike.com/a/images/f_auto/fa253650-9040-44ac-91e9-7b7175f1cc3f/image.jpeg"),
          ]);

  BenfitsState copyWith(
      {BenfitsViewType? type,
      DoctorType? filter,
      List<SportBenefit>? sportBenefits,
      List<MedicalBenefit>? medicalBenefits}) {
    return BenfitsState(
        filter: filter ?? this.filter,
        type: type ?? this.type,
        sportBenefits: sportBenefits ?? this.sportBenefits,
        medicalBenefits: medicalBenefits ?? this.medicalBenefits);
  }

  @override
  List<Object> get props =>
      [type, filter, medicalBenefits.length, sportBenefits.length];
}

enum BenfitsViewType {
  medical,
  sport;

  @override
  String toString() {
    switch (this) {
      case BenfitsViewType.sport:
        return StringManger.sport;
      case BenfitsViewType.medical:
        return StringManger.medical;
    }
  }

  IconData toIcon() {
    switch (this) {
      case BenfitsViewType.sport:
        return FontAwesomeIcons.personRunning;
      case BenfitsViewType.medical:
        return FontAwesomeIcons.userDoctor;
    }
  }
}
