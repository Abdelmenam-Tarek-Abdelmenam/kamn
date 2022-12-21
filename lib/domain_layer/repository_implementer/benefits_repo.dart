import 'package:either_dart/either.dart';

import '../../data/data_sources/web_services/mongo_repository.dart';
import '../../data/models/benfits.dart';
import '../../data/models/show_data.dart';
import 'error_state.dart';

class BenefitsRepository {
  Future<Either<Failure, ShowData<Benefit>>> getAllBenefits(
      int end, String type) async {
    try {
      List<Map<String, dynamic>?> jsonData =
          await MongoDatabase.instance.getBenfits(0, end, type);
      ShowData<Benefit> data;
      if (type == medicalModel) {
        data =
            ShowData(jsonData.map((e) => MedicalBenefit.fromJson(e!)).toList());
      } else {
        data =
            ShowData(jsonData.map((e) => OtherBenfits.fromJson(e!)).toList());
      }
      return Right(data);
    } catch (_, __) {
      return Left(Failure("Error happened while getting $type benfits"));
    }
  }
}
