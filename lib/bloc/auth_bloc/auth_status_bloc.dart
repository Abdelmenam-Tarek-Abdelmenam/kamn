import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:kamn/presentation/resources/string_manager.dart';

import '../../data/data_sources/pref_repository.dart';
import '../../data/models/app_user.dart';
import '../../domain_layer/repository_implementer/error_state.dart';
import '../../domain_layer/repository_implementer/sigining_repo.dart';
import '../../presentation/shared/toast_helper.dart';

part 'auth_status_event.dart';
part 'auth_status_state.dart';

class AuthBloc extends Bloc<AuthStatusEvent, AuthStates> {
  final SigningRepository _authRepository = SigningRepository();

  AuthBloc(CompleteUser? appUser) : super(AuthStates.initial(appUser)) {
    if (appUser != null) user = appUser.user;

    on<LoginInUsingGoogleEvent>(_loginUsingGoogleHandler);
    on<SignUpInUsingEmailEvent>(_signUpUsingEmailHandler);
    on<LoginInUsingEmailEvent>(_loginUsingEmailHandler);
    on<ForgetPasswordEvent>(_forgetPasswordHandler);
    on<ChangeAuthModeEvent>(_changeModeHandler);
    on<ChangeUserCategoryEvent>(_changeUserCategoryHandler);
    on<ChangeUserGameEvent>(_changUserGameHandler);
    on<RegisterUserDataEvent>(_registerUserDataHandler);
  }

  bool get loading => [AuthStatus.submittingEmail, AuthStatus.submittingGoogle]
      .contains(state.status);

  static AppUser user = AppUser.empty();

  void _changeModeHandler(ChangeAuthModeEvent event, Emitter<AuthStates> emit) {
    emit(state.copyWith(mode: event.mode, status: AuthStatus.initial));
  }

  void _changeUserCategoryHandler(
      ChangeUserCategoryEvent event, Emitter<AuthStates> emit) {
    emit(state.copyWith(category: event.category, status: AuthStatus.initial));
  }

  void _changUserGameHandler(
      ChangeUserGameEvent event, Emitter<AuthStates> emit) {
    emit(state.copyWith(game: event.game, status: AuthStatus.initial));
  }

  Future<void> _loginUsingGoogleHandler(
    LoginInUsingGoogleEvent event,
    Emitter<AuthStates> emit,
  ) async {
    if (loading) return;

    emit(state.copyWith(status: AuthStatus.submittingGoogle));
    Either<Failure, CompleteUser> value =
        await _authRepository.signInUsingGoogle();
    value.fold((failure) {
      failure.show;
      emit(state.copyWith(status: AuthStatus.error));
    }, (completeUser) {
      user = completeUser.user;
      if (completeUser.isComplete) {
        PreferenceRepository.putData(
            key: PreferenceKey.userData, value: completeUser.toJson);

        emit(state.copyWith(
            status: AuthStatus.successLogIn,
            game: completeUser.game,
            category: completeUser.category));
      } else {
        emit(state.copyWith(status: AuthStatus.successSignUp));
      }
    });
  }

  Future<void> _loginUsingEmailHandler(
    LoginInUsingEmailEvent event,
    Emitter<AuthStates> emit,
  ) async {
    if (loading) return;
    emit(state.copyWith(status: AuthStatus.submittingEmail));
    Either<Failure, CompleteUser> value = await _authRepository
        .signInWithEmailAndPassword(event.email, event.password);

    value.fold((failure) {
      failure.show;
      emit(state.copyWith(status: AuthStatus.error));
    }, (completeUser) {
      user = completeUser.user;
      if (completeUser.isComplete) {
        PreferenceRepository.putData(
            key: PreferenceKey.userData, value: completeUser.toJson);

        emit(state.copyWith(
            status: AuthStatus.successLogIn,
            game: completeUser.game,
            category: completeUser.category));
      } else {
        emit(state.copyWith(status: AuthStatus.successSignUp));
      }
    });
  }

  Future<void> _signUpUsingEmailHandler(
    SignUpInUsingEmailEvent event,
    Emitter<AuthStates> emit,
  ) async {
    if (loading) return;

    emit(state.copyWith(status: AuthStatus.submittingEmail));
    Either<Failure, AppUser> value = await _authRepository
        .signUpWithEmailAndPassword(event.email, event.password);
    value.fold((failure) {
      failure.show;
      emit(state.copyWith(status: AuthStatus.error));
    }, (appUser) {
      user = appUser;
      emit(state.copyWith(status: AuthStatus.successSignUp));
    });
  }

  Future<void> _forgetPasswordHandler(
    ForgetPasswordEvent event,
    Emitter<AuthStates> emit,
  ) async {
    if (loading) return;

    Either<Failure, void> value =
        await _authRepository.forgetPassword(event.email);
    value.fold((failure) {
      emit(state.copyWith(status: AuthStatus.error));
      failure.show;
    }, (_) {
      showToast("Password reset email sent to you", type: ToastType.info);
      emit(state.copyWith(status: AuthStatus.doneConfirm));
    });
  }

  Future<void> _registerUserDataHandler(
    RegisterUserDataEvent event,
    Emitter<AuthStates> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.registerUser));

    user.name = event.name;
    CompleteUser completeUser =
        CompleteUser(user: user, game: state.game, category: state.category);
    Either<Failure, void> value =
        await _authRepository.registerUser(completeUser);
    value.fold((failure) {
      emit(state.copyWith(status: AuthStatus.error));
      failure.show;
    }, (_) {
      PreferenceRepository.putData(
          key: PreferenceKey.userData, value: completeUser.toJson);
      emit(state.copyWith(status: AuthStatus.successLogIn));
    });
  }
}
