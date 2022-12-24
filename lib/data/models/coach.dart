import 'app_user.dart';

class Coach {
  String name;
  String id;
  String img;
  String position;
  Games game;
  double rating;

  String description;
  String onlineConsultation;
  String offlineConsultation;
  List<CoachAchievements> achievements;
  Map<String, String> subscriptions;
  List<String> reviews;

  Coach({
    required this.name,
    required this.id,
    required this.description,
    required this.img,
    required this.position,
    required this.rating,
    required this.game,
    required this.achievements,
    required this.reviews,
    required this.subscriptions,
    required this.onlineConsultation,
    required this.offlineConsultation,
  });

  factory Coach.fromJson(Map<String, dynamic> json) => Coach(
        name: json['name'],
        id: json['id'],
        description: json['description'],
        img: json['img'],
        position: json['position'],
        rating: json['rating'],
        onlineConsultation: json['onlineConsultation'],
        offlineConsultation: json['offlineConsultation'],
        game: Games.values[json['game']],
        reviews: List<String>.from(json['reviews'] ?? []),
        achievements: List<CoachAchievements>.from(
          json['achievements']?.map((e) => CoachAchievements.fromJson(e)) ?? [],
        ),
        subscriptions: Map<String, String>.from(json['subscription']),
      );

  Map<String, dynamic> get toJson => {
        "name": name,
        "id": id,
        "description": description,
        "img": img,
        "position": position,
        "rating": rating,
        "game": game.index,
        "reviews": reviews,
        "achievements": achievements.map((e) => e.toJson).toList(),
        "subscription": subscriptions,
        "onlineConsultation": onlineConsultation,
        "offlineConsultation": offlineConsultation,
      };
}

class CoachAchievements {
  String? url;
  String img;
  String name;
  String provider;
  String date;

  CoachAchievements({
    required this.name,
    required this.img,
    required this.date,
    required this.provider,
    required this.url,
  });

  factory CoachAchievements.fromJson(Map<String, dynamic> json) =>
      CoachAchievements(
          name: json['name'],
          img: json['img'],
          date: json['date'],
          provider: json['provider'],
          url: json['url']);

  Map<String, dynamic> get toJson => {
        "name": name,
        "img": img,
        "date": date,
        "provider": provider,
        "url": url
      };
}
