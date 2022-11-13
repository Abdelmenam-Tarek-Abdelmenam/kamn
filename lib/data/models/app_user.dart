import 'package:firebase_auth/firebase_auth.dart';

import '../../presentation/resources/string_manager.dart';

class AppUser {
  String id;
  String? email;
  String? photoUrl;
  String? name;

  AppUser({
    required this.id,
    this.name,
    this.email,
    this.photoUrl,
  });

  factory AppUser.fromFirebaseUser(
    User? user,
  ) {
    if (user == null) {
      return AppUser.empty;
    }
    return AppUser(
      id: user.uid,
      email: user.email,
      photoUrl: user.photoURL,
      name: user.displayName,
    );
  }

  static AppUser empty = AppUser(
    id: '',
  );

  bool get isEmpty => id == '';
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
  football,
  basketball,
  volleyball,
  tennis;

  @override
  String toString() {
    switch (this) {
      case Games.football:
        return StringManger.football;
      case Games.basketball:
        return StringManger.basketball;
      case Games.volleyball:
        return StringManger.volleyball;
      case Games.tennis:
        return StringManger.tennis;
    }
  }
}
