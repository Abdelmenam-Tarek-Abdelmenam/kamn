import '../../presentation/resources/string_manager.dart';

const testImage1 =
    "https://media.istockphoto.com/id/177373093/photo/indian-male-doctor.jpg?s=612x612&w=0&k=20&c=5FkfKdCYERkAg65cQtdqeO_D0JMv6vrEdPw3mX1Lkfg=";
const testImage2 =
    "https://img.freepik.com/free-photo/pleased-young-female-doctor-wearing-medical-robe-stethoscope-around-neck-standing-with-closed-posture_409827-254.jpg?w=2000";

const sportsModel = "sports";
const medicalModel = "medical";
const nutritionModel = "nutrition";

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
        benefit = json['benefit'],
        img = json['img'],
        description = json['description'];

  Map<String, dynamic> toSubJson(dynamic additional, String type) => {
        "name": name,
        "benefit": benefit,
        "description": description,
        "img": img,
        "id": id,
        "additional": additional,
        "type": type,
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

  Map<String, dynamic> get toJson => super.toSubJson(type.index, medicalModel);
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

  Map<String, dynamic> toJson(String type) => super.toSubJson(goods, type);
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

List<MedicalBenefit> mBenfits = [
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
];
List<OtherBenfits> sBenfits = [
  OtherBenfits(
      goods: "Shoes",
      id: "c",
      name: "Adidas",
      benefit: "30%",
      description: "description",
      img: "https://www.akropoleriga.lv/image/15622466113155_430_430_1.jpg"),
  OtherBenfits(
      goods: "T-Shirts",
      id: "d",
      name: "Nike",
      benefit: "free shipping",
      description: "description",
      img:
          "https://static.nike.com/a/images/f_auto/fa253650-9040-44ac-91e9-7b7175f1cc3f/image.jpeg"),
];
List<OtherBenfits> nBefits = [
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
];
