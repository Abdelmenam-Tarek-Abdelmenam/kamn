import 'package:mongo_dart/mongo_dart.dart';

const _mongoUrl =
    "mongodb+srv://admin:admin@cluster0.tuqcngd.mongodb.net/test?retryWrites=true&w=majority";
const _collectionName = "users";

class MongoDatabase {
  static late Db db;

  static Future<void> init() async {
    print("mongo init");
    db = await Db.create(_mongoUrl);
    await db.open();
  }

  Future<void> test() async {
    DbCollection collection = db.collection(_collectionName);
    await collection.insertOne(
        {"userName": "Abdelmenam", "email": "Abdelmenam@gmail", "pass": "123"});
    print(await collection.find().toList());
  }
}
