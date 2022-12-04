part of "auth_status_bloc.dart";

abstract class AuthStatusEvent extends Equatable {
  const AuthStatusEvent();

  @override
  List<Object?> get props => [];
}

class LoginInUsingGoogleEvent extends AuthStatusEvent {}

class RegisterUserDataEvent extends AuthStatusEvent {
  final String name;
  const RegisterUserDataEvent(this.name);
}

class ChangeAuthModeEvent extends AuthStatusEvent {
  final AuthModes mode;
  const ChangeAuthModeEvent(this.mode);

  @override
  List<Object?> get props => [mode];
}

class ChangeUserCategoryEvent extends AuthStatusEvent {
  final UserCategory category;
  const ChangeUserCategoryEvent(this.category);

  @override
  List<Object?> get props => [category];
}

class ChangeUserGameEvent extends AuthStatusEvent {
  final Games game;
  const ChangeUserGameEvent(this.game);

  @override
  List<Object?> get props => [game];
}

class LoginInUsingEmailEvent extends AuthStatusEvent {
  final String email;
  final String password;

  const LoginInUsingEmailEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class SignUpInUsingEmailEvent extends AuthStatusEvent {
  final String email;
  final String password;

  const SignUpInUsingEmailEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class ForgetPasswordEvent extends AuthStatusEvent {
  final String email;

  const ForgetPasswordEvent(this.email);

  @override
  List<Object?> get props => [email];
}
