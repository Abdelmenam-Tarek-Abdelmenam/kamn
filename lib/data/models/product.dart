class Product {
  final String name;
  final String provider;
  final String? picture;
  double price;
  List<String> varieties;
  final String id;
  List<String> reviews;

  String get img => picture ?? "";

  Product({
    required this.name,
    required this.provider,
    this.picture,
    required this.price,
    required this.id,
    required this.varieties,
    required this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        provider: json["provider"],
        price: json["price"],
        picture: json['picture'],
        id: json["id"],
        varieties: List<String>.from(json['varieties'] ?? []),
        reviews: List<String>.from(json['reviews'] ?? []),
      );

  Map<String, dynamic> get toJson => {
        "name": name,
        "provider": provider,
        "price": price,
        "id": id,
        'picture': picture,
        'reviews': reviews,
        'varieties': varieties,
      };
}

class OrderItem {
  Product product;
  int quantity;
  OrderItem(this.product, this.quantity);
}

class OfferItem {
  final double oldPrice;
  final Product product;

  OfferItem({required this.product, required this.oldPrice});

  factory OfferItem.fromJson(Map<String, dynamic> json) =>
      OfferItem(product: Product.fromJson(json), oldPrice: json['oldPrice']);

  Map<String, dynamic> get toJson =>
      product.toJson..addAll({"oldPrice": oldPrice});
}
