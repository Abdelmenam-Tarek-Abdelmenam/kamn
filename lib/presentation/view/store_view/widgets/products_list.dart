import 'package:flutter/material.dart';
import 'package:kamn/data/models/product.dart';
import 'package:kamn/data/models/show_data.dart';
import 'package:kamn/presentation/shared/widget/loading_text.dart';

import 'product_design.dart';

class ProductList extends StatelessWidget {
  const ProductList(this.products, {Key? key}) : super(key: key);
  final ShowData<Product> products;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(children: [
        ...products.data.map((e) => ProductDesign(e)).toList(),
        if (!products.isEnd)
          const Center(child: FittedBox(child: LoadingText()))
      ]),
    );
  }
}
