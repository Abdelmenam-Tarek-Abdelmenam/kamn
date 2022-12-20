import 'app_user.dart';

const testImg1 =
    "https://yt3.ggpht.com/ytc/AMLnZu9ZQhgmxwAWMeA182hyUknziu0St2EP_Hy0QFIG2g=s900-c-k-c0x00ffffff-no-rj";
const testImg2 =
    "https://www.padelmba.com/wp-content/uploads/2022/05/manu-martin-isotipo-min-1024x1024.png";

class Coach {
  String name;
  String id;
  String img;
  String position;
  double price;
  Games game;
  double rating;

  String description;

  Coach(
      {required this.name,
      required this.id,
      required this.description,
      required this.img,
      required this.price,
      required this.position,
      required this.rating,
      required this.game});

  factory Coach.fromJson(Map<String, dynamic> json) => Coach(
      name: json['name'],
      id: json['id'],
      description: json['description'],
      img: json['img'],
      price: json['price'],
      position: json['position'],
      rating: json['rating'],
      game: Games.values[json['game']]);

  Map<String, dynamic> get toJson => {
        "name": name,
        "id": id,
        "description": description,
        "img": img,
        "price": price,
        "position": position,
        "rating": rating,
        "game": game.index
      };
}
