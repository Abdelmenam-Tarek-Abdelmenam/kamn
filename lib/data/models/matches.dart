import 'package:kamn/data/models/app_user.dart';

const testImage1 =
    "https://media-cdn.tripadvisor.com/media/photo-s/0f/c7/47/36/football-playground.jpg";

class Ground {
  String name;
  String address;
  double price;
  String img;
  Games type;
  double rating;

  Ground({
    required this.name,
    required this.address,
    required this.price,
    required this.img,
    required this.type,
    required this.rating,
  });

  factory Ground.fromJson(Map<String, dynamic> json) => Ground(
      name: json['name'],
      address: json['address'],
      price: json['price'],
      img: json['img'],
      type: Games.values[json['type']],
      rating: json['rating']);

  Map<String, dynamic> get toJson => {
        "name": name,
        "address": address,
        "price": price,
        "img": img,
        "type": type.index,
        "rating": rating
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
