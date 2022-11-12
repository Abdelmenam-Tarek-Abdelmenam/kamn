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

class AuthStates extends Equatable {
  final AuthStatus status;
  final AppUser user;

  const AuthStates({required this.status, required this.user});

  factory AuthStates.initial(AppUser user) {
    return AuthStates(status: AuthStatus.initial, user: user);
  }

  @override
  List<Object?> get props => [status, user.id];

  AuthStates copyWith({AuthStatus? status, AppUser? user}) {
    return AuthStates(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
