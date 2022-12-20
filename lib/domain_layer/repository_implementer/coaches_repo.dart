import 'package:either_dart/either.dart';
import 'package:kamn/data/models/gym.dart';
import '../../data/data_sources/web_services/mongo_repository.dart';

import '../../data/models/coach.dart';
import '../../data/models/show_data.dart';
import 'error_state.dart';

class CoachesRepository {
  Future<Either<Failure, ShowData<Coach>>> getAllCoaches(int end) async {
    try {
      List<Map<String, dynamic>?> jsonData =
          await MongoDatabase.instance.getCoaches(0, end);
      ShowData<Coach> data =
          ShowData(jsonData.map((e) => Coach.fromJson(e!)).toList());
      return Right(data);
    } catch (_, __) {
      return const Left(Failure("Error happened while getting Coaches"));
    }
  }

  Future<Either<Failure, ShowData<Gym>>> getAllGyms(int end) async {
    try {
      List<Map<String, dynamic>?> jsonData =
          await MongoDatabase.instance.getGyms(0, end);
      ShowData<Gym> data =
          ShowData(jsonData.map((e) => Gym.fromJson(e!)).toList());

      return Right(data);
    } catch (_, __) {
      return const Left(Failure("Error happened while getting Gyms"));
    }
  }
}
