import 'package:either_dart/either.dart';
import 'package:kamn/data/models/ranked_user.dart';

import '../../data/data_sources/web_services/mongo_repository.dart';
import 'error_state.dart';

class RankedUserRepository {
  Future<Either<Failure, AllRanked>> getAllRanked() async {
    try {
      List<Map<String, dynamic>?> data =
          await MongoDatabase.instance.getRankedUser();
      return Right(AllRanked.fromJson(data));
    } catch (_) {
      return const Left(Failure("Error happened while getting ranked players"));
    }
  }
}

class AllRanked {
  final List<Player> topRanked;
  final List<Player> bottomRanked;

  const AllRanked({
    required this.topRanked,
    required this.bottomRanked,
  });

  factory AllRanked.fromJson(List<Map<String, dynamic>?> data) {
    int len = data.length;
    if (len < 3) {
      List<Player> topRanked =
          data.sublist(0).map((e) => Player.fromJson(e)).toList();
      topRanked.addAll(List.filled(3 - len, Player.empty()));
      return AllRanked(topRanked: topRanked, bottomRanked: []);
    } else {
      List<Player> topRanked =
          data.sublist(0, 3).map((e) => Player.fromJson(e)).toList();
      List<Player> bottomRanked =
          data.sublist(3).map((e) => Player.fromJson(e)).toList();
      return AllRanked(topRanked: topRanked, bottomRanked: bottomRanked);
    }
  }
}
