import 'package:kamn/data/models/app_user.dart';

class Ground {
  String name;
  String address;
  double price;
  String img;
  Games type;
  double rating;
  String activeHours;
  List<String> amenities;
  // Ball,Drinks,Changing Room,Cafeteria
  List<String> reviews;
  List<String> images;
  double lat;
  double lon;

  Ground({
    required this.name,
    required this.address,
    required this.price,
    required this.img,
    required this.type,
    required this.rating,
    required this.activeHours,
    required this.amenities,
    required this.images,
    required this.reviews,
    required this.lat,
    required this.lon,
  });

  factory Ground.fromJson(Map<String, dynamic> json) => Ground(
        name: json['name'],
        address: json['address'],
        price: json['price'],
        img: json['img'],
        activeHours: json['activeHours'],
        images: List<String>.from(json['images'] ?? []),
        reviews: List<String>.from(json['reviews'] ?? []),
        amenities: json['amenities'].split(","),
        type: Games.values[json['type']],
        rating: json['rating'],
        lat: json['lat'],
        lon: json['lon'],
      );

  Map<String, dynamic> get toJson => {
        "name": name,
        "address": address,
        "price": price,
        "img": img,
        "activeHours": activeHours,
        "amenities": amenities.join(","),
        "type": type.index,
        "rating": rating,
        "images": images,
        "reviews": reviews,
        "lon": lon,
        "lat": lat,
      };
}

class ActiveMatch {
  Games game;
  String playGroundName;
  int availableCount;
  String time;

  ActiveMatch({
    required this.game,
    required this.playGroundName,
    required this.availableCount,
    required this.time,
  });

  factory ActiveMatch.fromJson(Map<String, dynamic> json) => ActiveMatch(
      game: Games.values[json['game']],
      playGroundName: json['playGroundName'],
      availableCount: json['availableCount'],
      time: json['time']);

  Map<String, dynamic> get toJson => {
        "game": game.index,
        "playGroundName": playGroundName,
        "availableCount": availableCount,
        "time": time
      };
}
