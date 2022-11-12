import 'package:firebase_auth/firebase_auth.dart';

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
