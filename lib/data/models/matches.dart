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
}
