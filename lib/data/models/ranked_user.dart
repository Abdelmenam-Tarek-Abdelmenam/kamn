import 'package:kamn/data/models/app_user.dart';

const noPlayer =
    "https://www.thesun.co.uk/wp-content/uploads/2018/05/tp-image-gay-footballer-silouhette1.jpg?strip=all&quality=100&w=960&h=960&crop=1";

class Player extends AppUser {
  Player(
      {required super.name,
      required super.id,
      required super.photoUrl,
      required super.score});

  factory Player.empty() =>
      Player(name: "", id: "", photoUrl: noPlayer, score: 0);

  factory Player.fromJson(Map<String, dynamic>? json) => json == null
      ? Player.empty()
      : Player(
          id: json['id'],
          photoUrl: json["photoUrl"],
          name: json["name"],
          score: json['score']);
}
