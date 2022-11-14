class Product {
  final String name;
  final String provider;
  final String? _picture;
  final double price;
  final String id;

  String get img => _picture ?? "";

  Product(
      {required this.name,
      required this.provider,
      String? img,
      required this.price,
      required this.id})
      : _picture = img;
}

class OrderItem {
  Product product;
  int quantity;
  OrderItem(this.product, this.quantity);
}

class OfferItem {
  final Product product;
  final OfferType type;
  final double offer;

  OfferItem({required this.product, required this.offer, required this.type});
}

enum OfferType { percentage, discount }
