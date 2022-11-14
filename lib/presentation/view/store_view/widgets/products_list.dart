import 'package:flutter/material.dart';
import 'package:kamn/data/models/product.dart';

import 'product_design.dart';

class ProductList extends StatelessWidget {
  ProductList({Key? key}) : super(key: key);
  final List<Product> products = [
    Product(
        name: "FORUM MID SHOES",
        provider: "Adidas",
        price: 3249,
        id: "id",
        img: testImage1),
    Product(
        name: "Purple shoe",
        provider: "Nike",
        price: 125 * 24,
        id: "id",
        img: testImage2),
    Product(
        name: "FORUM MID SHOES",
        provider: "Adidas",
        price: 3249,
        id: "id",
        img: testImage1),
    Product(
        name: "Purple shoe",
        provider: "Nike",
        price: 125 * 24,
        id: "id",
        img: testImage2),
    Product(
        name: "FORUM MID SHOES",
        provider: "Adidas",
        price: 3249,
        id: "id",
        img: testImage1),
    Product(
        name: "Purple shoe",
        provider: "Nike",
        price: 125 * 24,
        id: "id",
        img: testImage2),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(children: products.map((e) => ProductDesign(e)).toList()),
    );
  }
}
