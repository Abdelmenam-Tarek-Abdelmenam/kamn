import 'package:either_dart/either.dart';
import 'package:kamn/data/models/product.dart';
import 'package:kamn/data/models/show_data.dart';

import '../../data/data_sources/web_services/mongo_repository.dart';
import 'error_state.dart';

class StoreRepository {
  Future<Either<Failure, AllStore>> getAllStore(int end) async {
    try {
      List<Map<String, dynamic>?> offerData =
          await MongoDatabase.instance.getOffers();
      List<OfferItem> offers =
          offerData.map((e) => OfferItem.fromJson(e!)).toList();
      List<Map<String, dynamic>?> storeData =
          await MongoDatabase.instance.getProduct(0, end);
      List<Product> products =
          storeData.map((e) => Product.fromJson(e!)).toList();
      ShowData<Product> productsShow = ShowData(products);
      return Right(AllStore(offers: offers, products: productsShow));
    } catch (_) {
      return const Left(Failure("Error happened while getting ranked players"));
    }
  }

  Future<Either<Failure, ShowData<Product>>> getMoreStore(
      ShowData<Product> old) async {
    try {
      old.getNext();
      print("start ${old.start} , end ${old.end}");
      List<Map<String, dynamic>?> storeData =
          await MongoDatabase.instance.getProduct(old.start, old.end);
      print(storeData.length);
      List<Product> products =
          storeData.map((e) => Product.fromJson(e!)).toList();
      old.data.addAll(products);
      print(old.data.length);
      return Right(old);
    } catch (_) {
      print(_);
      return const Left(Failure("Error happened while getting ranked players"));
    }
  }
}

class AllStore {
  final ShowData<Product> products;
  final List<OfferItem> offers;

  const AllStore({
    required this.products,
    required this.offers,
  });
}
