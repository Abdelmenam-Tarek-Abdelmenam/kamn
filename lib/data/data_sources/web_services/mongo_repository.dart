import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:kamn/data/repository_implementer/error_state.dart';
import 'package:mongo_dart/mongo_dart.dart';

const _mongoUrl =
    "mongodb+srv://admin:admin@cluster0.8lmf105.mongodb.net/db?retryWrites=true&w=majority";

const _userCollection = "users";
const _storeCollection = "store";
const _offersCollection = "offers";
const _tournamentsCollection = "tournaments";
const _customerMessageCollection = "customerMessage";
const _groundsCollection = "grounds";
const _activeMatchesCollection = "activeMatches";
// const _benfitsCollection = "benfits";
// const _coachesCollection = "coaches";
// const _gymCollection = "gym";

class MongoDatabase {
  Db? _db;
  static MongoDatabase? _instance;
  static MongoDatabase get instance => _instance ??= MongoDatabase();

  Future<void> init() async {
    if (await Connectivity().isNotConnected()) return;
    try {
      _db = await Db.create(_mongoUrl);
      await _db?.open();
    } catch (_) {}
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

  Future<void> setUserAvailable(String id, bool state) async {
    await _preCheck();

    DbCollection collection = _db!.collection(_userCollection);
    collection.updateOne(where.eq('id', id), modify.set('available', state));
  }

  Future<bool?> getUserAvailable(String id) async {
    await _preCheck();

    DbCollection collection = _db!.collection(_userCollection);
    Map<String, dynamic>? data =
        await collection.findOne(where.eq('id', id).fields(['available']));
    return data!['available'];
  }

  Future<Map<String, dynamic>?> getUserAvailability(String id) async {
    await _preCheck();

    DbCollection collection = _db!.collection(_userCollection);
    return collection.findOne({"id": id});
  }

  Future<List<Map<String, dynamic>?>> getRankedUser() async {
    await _preCheck();

    DbCollection collection = _db!.collection(_userCollection);
    return await collection
        .find(where.sortBy('score', descending: true).limit(50))
        .toList();
  }

  Future<List<Map<String, dynamic>?>> getProduct(int start, int end) async {
    await _preCheck();

    DbCollection collection = _db!.collection(_storeCollection);
    return await collection.find(where.skip(start).limit(end)).toList();
  }

  Future<List<Map<String, dynamic>?>> getOffers() async {
    await _preCheck();

    DbCollection collection = _db!.collection(_offersCollection);
    return await collection.find().toList();
  }

  Future<List<Map<String, dynamic>?>> getTournaments(int start, int end) async {
    await _preCheck();

    DbCollection collection = _db!.collection(_tournamentsCollection);
    return await collection
        .find(where.sortBy('date', descending: true).limit(end).skip(start))
        .toList();
  }

  Future<List<Map<String, dynamic>?>> getGrounds(int start, int end) async {
    await _preCheck();

    DbCollection collection = _db!.collection(_groundsCollection);
    return await collection.find(where.limit(end).skip(start)).toList();
  }

  Future<List<Map<String, dynamic>?>> getActiveMatches(
      int start, int end) async {
    await _preCheck();

    DbCollection collection = _db!.collection(_activeMatchesCollection);
    return await collection.find(where.limit(end).skip(start)).toList();
  }

  Future<void> sendMessage(Map<String, dynamic> userData) async {
    await _preCheck();
    DbCollection collection = _db!.collection(_customerMessageCollection);
    await collection.insert(userData);
  }

  Future<void> _preCheck() async {
    if (_db == null) await init();
    if (await Connectivity().isNotConnected()) {
      throw const Failure("No Internet connection");
    }
  }

  Future<void> saveData(List<Map<String, dynamic>> data) async {
    await _preCheck();
    DbCollection collection = _db!.collection(_activeMatchesCollection);
    await collection.insertMany(data);
  }
}

extension Check on Connectivity {
  Future<bool> isNotConnected() async {
    var connectivityResult = await (checkConnectivity());
    return connectivityResult == ConnectivityResult.none;
  }
}
