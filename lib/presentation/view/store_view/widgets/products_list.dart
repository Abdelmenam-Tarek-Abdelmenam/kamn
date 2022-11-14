import 'package:flutter/material.dart';
import 'package:kamn/data/models/product.dart';

import 'product_design.dart';

class ProductList extends StatelessWidget {
  ProductList({Key? key}) : super(key: key);
  final List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(children: products.map((e) => ProductDesign(e)).toList()),
    );
  }
}
