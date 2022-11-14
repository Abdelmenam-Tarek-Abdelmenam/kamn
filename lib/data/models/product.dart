const testImage1 =
    "https://assets.adidas.com/images/w_1880,f_auto,q_auto/c9fdf27c73cc481aa8efacb6002c81bc_9366/FY7939_01_standard.jpg";
const testImage2 =
    "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/dc36a688-526a-40a7-b412-40e734a74487/dunk-high-retro-mens-shoe-dTVTCk.png";

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
  final double newPrice;

  OfferItem({required this.product, required this.newPrice});
}
