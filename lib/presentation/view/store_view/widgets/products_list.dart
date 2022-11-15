import 'package:flutter/material.dart';
import 'package:kamn/data/models/product.dart';

import 'product_design.dart';

class ProductList extends StatelessWidget {
  ProductList({Key? key}) : super(key: key);
  final List<Product> products = [
    Product(
        name: "T-Shirt",
        provider: "KAMN",
        price: 250,
        id: "5",
        img: testImage1),
    Product(
        name: "KAMN Hat",
        provider: "KAMN",
        price: 70,
        id: "6",
        img: testImage2),
    Product(
        name: "Bottle", provider: "KAMN", price: 50, id: "7", img: testImage3),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(children: products.map((e) => ProductDesign(e)).toList()),
    );
  }
}
