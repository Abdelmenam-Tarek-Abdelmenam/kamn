const testImage1 =
    "https://firebasestorage.googleapis.com/v0/b/kamn-bd641.appspot.com/o/products%2FWhatsApp%20Image%202022-11-15%20at%207.36.48%20PM.jpeg?alt=media&token=c8da1a4d-ba05-4c1e-832a-10eb7d188d48";
const testImage2 =
    "https://firebasestorage.googleapis.com/v0/b/kamn-bd641.appspot.com/o/products%2FWhatsApp%20Image%202022-11-15%20at%208.20.49%20PM.jpeg?alt=media&token=6d6f86a6-0b1c-4767-b321-b3235cec1f51";
const testImage3 =
    "https://firebasestorage.googleapis.com/v0/b/kamn-bd641.appspot.com/o/products%2FWhatsApp%20Image%202022-11-15%20at%208.20.57%20PM.jpeg?alt=media&token=1763b777-835c-4453-8067-27c4e985d20e";

class Product {
  final String name;
  final String provider;
  final String? _picture;
  double price;
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
