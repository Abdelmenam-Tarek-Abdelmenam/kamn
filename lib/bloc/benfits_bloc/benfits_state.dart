part of 'benfits_bloc.dart';

class BenfitsState extends Equatable {
  final BenfitsViewType type;
  final DoctorType filter;
  final List<OtherBenfits> sportBenefits;
  final List<MedicalBenefit> medicalBenefits;
  final List<OtherBenfits> nutritionBenefits;

  List<Benefit> get benfits => {
        BenfitsViewType.medical: medicalBenefits,
        BenfitsViewType.sport: sportBenefits,
        BenfitsViewType.nutrition: nutritionBenefits
      }[type]!;

  const BenfitsState(
      {required this.type,
      required this.filter,
      required this.medicalBenefits,
      required this.sportBenefits,
      required this.nutritionBenefits});

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
            OtherBenfits(
                goods: "Shoes",
                id: "c",
                name: "Adidas",
                benefit: "30%",
                description: "description",
                img:
                    "https://www.akropoleriga.lv/image/15622466113155_430_430_1.jpg"),
            OtherBenfits(
                goods: "T-Shirts",
                id: "d",
                name: "Nike",
                benefit: "free shipping",
                description: "description",
                img:
                    "https://static.nike.com/a/images/f_auto/fa253650-9040-44ac-91e9-7b7175f1cc3f/image.jpeg"),
          ],
          nutritionBenefits: [
            OtherBenfits(
                goods: "Health expert",
                id: "h",
                name: "Ahmed Mahmoud",
                benefit: "30%",
                description: "description",
                img:
                    "https://hips.hearstapps.com/hmg-prod/images/portrait-of-a-happy-young-doctor-in-his-clinic-royalty-free-image-1661432441.jpg?crop=0.66698xw:1xh;center,top&resize=640:*"),
            OtherBenfits(
                goods: "Restaurant",
                id: "d",
                name: "Laziz",
                benefit: "free delivery",
                description: "description",
                img:
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Tom%27s_Restaurant%2C_NYC.jpg/1280px-Tom%27s_Restaurant%2C_NYC.jpg"),
          ]);

  BenfitsState copyWith(
      {BenfitsViewType? type,
      DoctorType? filter,
      List<OtherBenfits>? sportBenefits,
      List<OtherBenfits>? nutritionBenefits,
      List<MedicalBenefit>? medicalBenefits}) {
    return BenfitsState(
        filter: filter ?? this.filter,
        type: type ?? this.type,
        sportBenefits: sportBenefits ?? this.sportBenefits,
        nutritionBenefits: nutritionBenefits ?? this.nutritionBenefits,
        medicalBenefits: medicalBenefits ?? this.medicalBenefits);
  }

  @override
  List<Object> get props =>
      [type, filter, medicalBenefits.length, sportBenefits.length];
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
