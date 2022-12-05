class Product {
  final String name;
  final String provider;
  final String? picture;
  double price;
  final String id;

  String get img => picture ?? "";

  Product(
      {required this.name,
      required this.provider,
      this.picture,
      required this.price,
      required this.id});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      name: json["name"],
      provider: json["provider"],
      price: json["price"],
      picture: json['picture'],
      id: json["id"]);

  Map<String, dynamic> get toJson => {
        "name": name,
        "provider": provider,
        "price": price,
        "id": id,
        'picture': picture
      };
}

class OrderItem {
  Product product;
  int quantity;
  OrderItem(this.product, this.quantity);
}

class OfferItem extends Product {
  final double oldPrice;

  OfferItem(
      {required super.name,
      required super.provider,
      super.picture,
      required super.price,
      required super.id,
      required this.oldPrice});

  factory OfferItem.fromJson(Map<String, dynamic> json) => OfferItem(
      name: json["name"],
      provider: json["provider"],
      picture: json["picture"],
      oldPrice: json['oldPrice'],
      price: json["price"],
      id: json["id"]);

  @override
  Map<String, dynamic> get toJson =>
      super.toJson..addAll({"oldPrice": oldPrice});
}
