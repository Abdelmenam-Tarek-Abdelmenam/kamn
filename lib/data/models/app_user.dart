import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import '../../presentation/resources/string_manager.dart';

class AppUser {
  final String id;
  final String? email;
  final String? photoUrl;
  String? name;
  int score;

  @override
  String toString() {
    return "User $name with email $email";
  }

  AppUser(
      {required this.id, this.name, this.email, this.photoUrl, this.score = 0});

  Map<String, dynamic> get toJson => {
        "id": id,
        "email": email,
        "photoUrl": photoUrl,
        "name": name,
        "score": score
      };

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
      id: json['id'],
      email: json["email"],
      photoUrl: json["photoUrl"],
      name: json["name"],
      score: json['score']);

  factory AppUser.fromFirebaseUser(
    User? user,
  ) =>
      user == null
          ? AppUser.empty()
          : AppUser(
              id: user.uid,
              email: user.email,
              photoUrl: user.photoURL,
              name: user.displayName,
            );

  factory AppUser.empty() => AppUser(
        id: '',
      );

  bool get isEmpty => id == '';
}

class CompleteUser {
  AppUser user;
  UserCategory? category;
  Games? game;

  CompleteUser(
      {required this.user, this.category, this.game, String? userName});

  Map<String, dynamic> get toJson =>
      {...user.toJson, "Game": game!.index, "category": category!.index};

  factory CompleteUser.fromJson(dynamic jsonData) {
    jsonData = jsonData is String ? json.decode(jsonData) : jsonData;
    return CompleteUser(
        game: Games.values[jsonData['Game']],
        category: UserCategory.values[jsonData["category"]],
        user: AppUser.fromJson(jsonData));
  }

  factory CompleteUser.inComplete(AppUser user) => CompleteUser(user: user);

  bool get isComplete => game != null;
}

enum UserCategory {
  player,
  coach,
  referee,
  fieldOwner;

  @override
  String toString() {
    switch (this) {
      case UserCategory.player:
        return StringManger.player;
      case UserCategory.coach:
        return StringManger.coach;
      case UserCategory.referee:
        return StringManger.referee;
      case UserCategory.fieldOwner:
        return StringManger.fieldOwner;
    }
  }
}

enum Games {
  all,
  gym,
  football,
  basketball,
  volleyball,
  tennis,
  other;

  @override
  String toString() {
    switch (this) {
      case Games.all:
        return StringManger.all;
      case Games.football:
        return StringManger.football;
      case Games.basketball:
        return StringManger.basketball;
      case Games.volleyball:
        return StringManger.volleyball;
      case Games.tennis:
        return StringManger.tennis;
      case Games.gym:
        return StringManger.gym;
      case Games.other:
        return StringManger.other;
    }
  }
}
