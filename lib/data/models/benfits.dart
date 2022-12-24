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
  List<String> reviews;
  double lat;
  double lon;
  String address;
  Map<String, String> packages;

  Benefit(this.id, this.name, this.benefit, this.img, this.description,
      this.packages, this.address, this.reviews, this.lat, this.lon);

  Benefit.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        benefit = json['benefit'],
        img = json['img'],
        description = json['description'],
        packages = Map<String, String>.from(json['packages']),
        address = json['address'],
        reviews = List<String>.from(json['reviews'] ?? []),
        lat = json['lat'],
        lon = json['lon'];

  Map<String, dynamic> toSubJson(dynamic additional, String type) => {
        "name": name,
        "benefit": benefit,
        "description": description,
        "img": img,
        "id": id,
        "additional": additional,
        "type": type,
        "packages": packages,
        "address": address,
        "reviews": reviews,
        "lat": lat,
        "lon": lon
      };
}

class MedicalBenefit extends Benefit {
  DoctorType type;

  MedicalBenefit({
    required String name,
    required String id,
    required String benefit,
    required String description,
    required String img,
    required this.type,
    required Map<String, String> packages,
    required String address,
    required List<String> reviews,
    required double lat,
    required double lon,
  }) : super(id, name, benefit, img, description, packages, address, reviews,
            lat, lon);

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
    required Map<String, String> packages,
    required String address,
    required List<String> reviews,
    required double lat,
    required double lon,
  }) : super(id, name, benefit, img, description, packages, address, reviews,
            lat, lon);

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
