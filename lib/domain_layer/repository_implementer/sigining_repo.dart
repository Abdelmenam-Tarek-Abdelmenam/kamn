import 'package:either_dart/either.dart';
import 'package:kamn/data/data_sources/web_services/mongo_repository.dart';
import 'package:kamn/data/models/app_user.dart';

import '../../data/repositories/auth_repository.dart';
import 'error_state.dart';

class SigningRepository {
  MongoDatabase get mongo => MongoDatabase.instance;
  final AuthRepository _authRepository = AuthRepository();

  Future<Either<Failure, CompleteUser>> signInUsingGoogle() async {
    try {
      AppUser user = await _authRepository.signInUsingGoogle();
      return Right(await getUser(user));
    } on FireBaseAuthErrors catch (err) {
      return Left(Failure.fromError(err));
    } catch (_) {
      return const Left(Failure("Error happened while getting user data"));
    }
  }

  Future<Either<Failure, CompleteUser>> signInWithEmailAndPassword(
      String email, String pass) async {
    if (email.isEmpty || pass.isEmpty) {
      return const Left(Failure("Email and password can't be empty"));
    }

    try {
      AppUser user =
          await _authRepository.signInWithEmailAndPassword(email, pass);
      return Right(await getUser(user));
    } on FireBaseAuthErrors catch (e) {
      return Left(Failure.fromError(e));
    } catch (_) {
      return const Left(Failure("Error happened while sign in"));
    }
  }

  Future<Either<Failure, AppUser>> signUpWithEmailAndPassword(
      String email, String pass) async {
    if (email.isEmpty || pass.isEmpty) {
      return const Left(Failure("Email and password can't be empty"));
    }

    try {
      AppUser user =
          await _authRepository.signUpWithEmailAndPassword(email, pass);
      return Right(user);
    } on FireBaseAuthErrors catch (e) {
      return Left(Failure.fromError(e));
    } catch (_) {
      return const Left(Failure("Error happened while sign in"));
    }
  }

  Future<Either<Failure, void>> forgetPassword(String email) async {
    if (email.isEmpty) {
      return const Left(Failure("Email can't be empty"));
    }

    try {
      await _authRepository.forgetPassword(email);
      return const Right(null);
    } on FireBaseAuthErrors catch (e) {
      return Left(Failure.fromError(e));
    } catch (_) {
      return const Left(Failure("Error happened while sign in"));
    }
  }

  Future<Either<Failure, void>> registerUser(CompleteUser user) async {
    if (user.user.name!.isEmpty) {
      return const Left(Failure("Name and password can't be empty"));
    }

    try {
      Map<String, dynamic> data = user.toJson;
      await mongo.addUser(data);
      return const Right(null);
    } catch (_) {
      return const Left(Failure("Error happened while register user"));
    }
  }

  Future<CompleteUser> getUser(AppUser user) async {
    Map<String, dynamic>? userData = await mongo.getUser(user.id);
    return (userData == null
        ? CompleteUser.inComplete(user)
        : CompleteUser.fromJson(userData));
  }
}
