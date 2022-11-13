part of "auth_status_bloc.dart";

enum AuthStatus {
  initial,
  submittingEmail,
  submittingGoogle,
  sendingConfirm,
  doneConfirm,
  successLogIn,
  successSignUp,
  error,
}

enum AuthModes { login, signUp, forgetPass }

extension Names on AuthModes {
  String get getName {
    switch (this) {
      case AuthModes.login:
        return StringManger.login;
      case AuthModes.signUp:
        return StringManger.signUp;
      case AuthModes.forgetPass:
        return StringManger.forgetPassword;
    }
  }
}

class AuthStates extends Equatable {
  final AuthStatus status;
  final AppUser user;
  final AuthModes mode;
  final UserCategory category;
  final Games game;

  const AuthStates(
      {required this.status,
      required this.user,
      required this.mode,
      required this.category,
      required this.game});

  factory AuthStates.initial(AppUser user) {
    return AuthStates(
        status: AuthStatus.initial,
        user: user,
        mode: AuthModes.login,
        category: UserCategory.player,
        game: Games.football);
  }

  @override
  List<Object?> get props => [status, user.id, mode, game, category];

  AuthStates copyWith(
      {AuthStatus? status,
      AppUser? user,
      AuthModes? mode,
      UserCategory? category,
      Games? game}) {
    return AuthStates(
      status: status ?? this.status,
      user: user ?? this.user,
      mode: mode ?? this.mode,
      category: category ?? this.category,
      game: game ?? this.game,
    );
  }
}
