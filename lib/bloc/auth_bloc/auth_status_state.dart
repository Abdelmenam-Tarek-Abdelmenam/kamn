part of "auth_status_bloc.dart";

enum AuthStatus {
  initial,
  registerUser,
  submittingEmail,
  submittingGoogle,
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
  final AuthModes mode;
  final UserCategory category;
  final Games game;

  const AuthStates(
      {required this.status,
      required this.mode,
      required this.category,
      required this.game});

  factory AuthStates.initial() {
    return const AuthStates(
        status: AuthStatus.initial,
        mode: AuthModes.login,
        category: UserCategory.player,
        game: Games.football);
  }

  @override
  List<Object?> get props => [status, mode, game, category];

  AuthStates copyWith(
      {AuthStatus? status,
      AuthModes? mode,
      UserCategory? category,
      Games? game}) {
    return AuthStates(
      status: status ?? this.status,
      mode: mode ?? this.mode,
      category: category ?? this.category,
      game: game ?? this.game,
    );
  }
}
