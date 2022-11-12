import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/app_user.dart';
import '../../data/repositories/auth_repository.dart';
import '../../presentation/shared/toast_helper.dart';

part 'auth_status_event.dart';
part 'auth_status_state.dart';

class AuthBloc extends Bloc<AuthStatusEvent, AuthStates> {
  final AuthRepository _authRepository = AuthRepository();

  AuthBloc(AppUser user) : super(AuthStates.initial(user)) {
    on<LoginInUsingGoogleEvent>(_loginUsingGoogleHandler);
    on<SignUpInUsingEmailEvent>(_signUpUsingEmailHandler);
    on<LoginInUsingEmailEvent>(_loginUsingEmailHandler);
    on<ForgetPasswordEvent>(_forgetPasswordHandler);
  }

  Future<void> _loginUsingGoogleHandler(
    LoginInUsingGoogleEvent event,
    Emitter<AuthStates> emit,
  ) async {
    if ([AuthStatus.submittingEmail, AuthStatus.submittingGoogle]
        .contains(state.status)) {
      return;
    }
    emit(state.copyWith(status: AuthStatus.submittingGoogle));
    try {
      AppUser newUser = await _authRepository.signInUsingGoogle();
      emit(state.copyWith(status: AuthStatus.successLogIn, user: newUser));
    } on FireBaseAuthErrors catch (e) {
      showToast(e.message);
      emit(
        state.copyWith(status: AuthStatus.error),
      );
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.error),
      );
    }
  }

  Future<void> _loginUsingEmailHandler(
    LoginInUsingEmailEvent event,
    Emitter<AuthStates> emit,
  ) async {
    if ([
      AuthStatus.submittingEmail,
      AuthStatus.submittingGoogle,
    ].contains(state.status)) {
      return;
    }
    emit(state.copyWith(status: AuthStatus.submittingEmail));

    try {
      AppUser newUser = await _authRepository.signInWithEmailAndPassword(
          event.email, event.password);
      emit(state.copyWith(status: AuthStatus.successLogIn, user: newUser));
    } on FireBaseAuthErrors catch (e) {
      showToast(e.message, type: ToastType.error);
      emit(state.copyWith(status: AuthStatus.error));
    } catch (_) {
      emit(state.copyWith(status: AuthStatus.error));
    }
  }

  Future<void> _signUpUsingEmailHandler(
    SignUpInUsingEmailEvent event,
    Emitter<AuthStates> emit,
  ) async {
    if ([AuthStatus.submittingEmail, AuthStatus.submittingGoogle]
        .contains(state.status)) {
      return;
    }
    emit(state.copyWith(status: AuthStatus.submittingEmail));

    try {
      AppUser newUser = await _authRepository.signUpWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(state.copyWith(status: AuthStatus.successSignUp, user: newUser));
    } on FireBaseAuthErrors catch (e) {
      showToast(e.message, type: ToastType.error);
      emit(state.copyWith(status: AuthStatus.error));
    } catch (_) {
      emit(state.copyWith(status: AuthStatus.error));
    }
  }

  Future<void> _forgetPasswordHandler(
    ForgetPasswordEvent event,
    Emitter<AuthStates> emit,
  ) async {
    if (AuthStatus.sendingConfirm == state.status) {
      return;
    }
    emit(state.copyWith(status: AuthStatus.sendingConfirm));
    showToast("Password reset email sent to you", type: ToastType.info);
    try {
      await _authRepository.forgetPassword(event.email);
      emit(state.copyWith(status: AuthStatus.doneConfirm));
    } on FireBaseAuthErrors catch (e) {
      showToast(e.message, type: ToastType.error);
      emit(state.copyWith(status: AuthStatus.error));
    } catch (_) {
      emit(state.copyWith(status: AuthStatus.error));
    }
  }
}
