import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:kamn/data/repository_implementer/error_state.dart';
import 'package:mongo_dart/mongo_dart.dart';

const _mongoUrl =
    "mongodb+srv://admin:admin@cluster0.8lmf105.mongodb.net/db?retryWrites=true&w=majority";

const _userCollection = "users";
const _storeCollection = "store";
const _offersCollection = "offers";

class MongoDatabase {
  Db? _db;
  static MongoDatabase? _instance;
  static MongoDatabase get instance => _instance ??= MongoDatabase();

  Future<void> init() async {
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

  Future<List<Map<String, dynamic>?>> getAllUser() async {
    await _preCheck();

    DbCollection collection = _db!.collection(_userCollection);
    return await collection
        .find(where.sortBy('score', descending: true).limit(50))
        .toList();
  }

  Future<List<Map<String, dynamic>?>> getSomeProduct(int start, int end) async {
    await _preCheck();

    DbCollection collection = _db!.collection(_storeCollection);
    return await collection.find(where.skip(start).limit(end)).toList();
  }

  Future<List<Map<String, dynamic>?>> getOffers() async {
    await _preCheck();

    DbCollection collection = _db!.collection(_offersCollection);
    return await collection.find().toList();
  }

  Future<void> _preCheck() async {
    if (_db == null) await init();
    if (await Connectivity().isNotConnected()) {
      throw const Failure("No Internet connection");
    }
  }

  // Future<void> saveProducts(List<Map<String, dynamic>> data) async {
  //     await _preCheck();
  //     DbCollection collection = _db!.collection(_storeCollection);
  //     await collection.insertMany(data);
  //   }
  //
  //   Future<void> saveOffers(List<Map<String, dynamic>> data) async {
  //     await _preCheck();
  //     DbCollection collection = _db!.collection(_offersCollection);
  //     await collection.insertMany(data);
  //   }
}

extension Check on Connectivity {
  Future<bool> isNotConnected() async {
    var connectivityResult = await (checkConnectivity());
    return connectivityResult == ConnectivityResult.none;
  }
}
