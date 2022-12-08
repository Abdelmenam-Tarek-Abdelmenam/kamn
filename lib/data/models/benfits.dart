import '../../presentation/resources/string_manager.dart';

const testImage1 =
    "https://media.istockphoto.com/id/177373093/photo/indian-male-doctor.jpg?s=612x612&w=0&k=20&c=5FkfKdCYERkAg65cQtdqeO_D0JMv6vrEdPw3mX1Lkfg=";
const testImage2 =
    "https://img.freepik.com/free-photo/pleased-young-female-doctor-wearing-medical-robe-stethoscope-around-neck-standing-with-closed-posture_409827-254.jpg?w=2000";

abstract class Benefit {
  String name;
  String benefit;
  String description;
  String img;
  String id;
  Benefit(this.id, this.name, this.benefit, this.img, this.description);

  Benefit.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        benefit = json['benfits'],
        img = json['img'],
        description = json['description'];

  Map<String, dynamic> toSubJson(dynamic additional) => {
        "name": name,
        "benefit": benefit,
        "description": description,
        "img": img,
        "id": id,
        "additional": additional
      };
}

class MedicalBenefit extends Benefit {
  DoctorType type;

  MedicalBenefit(
      {required String name,
      required String id,
      required String benefit,
      required String description,
      required String img,
      required this.type})
      : super(id, name, benefit, img, description);

  MedicalBenefit.fromJson(Map<String, dynamic> json)
      : type = DoctorType.values[json['additional']],
        super.fromJson(json);

  Map<String, dynamic> get toJson => super.toSubJson(type.index);
}

class OtherBenfits extends Benefit {
  String goods;
  OtherBenfits({
    required String name,
    required this.goods,
    required String id,
    required String benefit,
    required String description,
    required String img,
  }) : super(id, name, benefit, img, description);

  OtherBenfits.fromJson(Map<String, dynamic> json)
      : goods = json['additional'],
        super.fromJson(json);

  Map<String, dynamic> get toJson => super.toSubJson(goods);
}

enum DoctorType {
  all,
  orthopedist,
  physiotherapist;

  @override
  String toString() {
    switch (this) {
      case DoctorType.orthopedist:
        return StringManger.orthopedist;
      case DoctorType.physiotherapist:
        return StringManger.physiotherapist;
      case DoctorType.all:
        return StringManger.all;
    }
  }
}
