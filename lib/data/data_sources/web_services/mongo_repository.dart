import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:kamn/data/repository_implementer/error_state.dart';
import 'package:mongo_dart/mongo_dart.dart';

const _mongoUrl =
    "mongodb+srv://admin:admin@cluster0.8lmf105.mongodb.net/db?retryWrites=true&w=majority";

const _userCollection = "users";

class MongoDatabase {
  static Db? _db;

  static Future<void> init() async {
    if (await Connectivity().isNotConnected()) return;
    _db = await Db.create(_mongoUrl);
    await _db?.open();
  }

  Future<void> addUser(Map<String, dynamic> userData) async {
    await _preCheck();
    DbCollection collection = _db!.collection(_userCollection);
    await collection.insert(userData);
  }

  Future<Map<String, dynamic>?> getUser(String id) async {
    await _preCheck();

    DbCollection collection = _db!.collection(_userCollection);
    return collection.findOne({"id": id});
  }

  Future<void> _preCheck() async {
    if (_db == null) await init();
    if (await Connectivity().isNotConnected()) {
      throw const Failure("No Internet connection");
    }
  }
}

extension Check on Connectivity {
  Future<bool> isNotConnected() async {
    var connectivityResult = await (checkConnectivity());
    return connectivityResult == ConnectivityResult.none;
  }
}
