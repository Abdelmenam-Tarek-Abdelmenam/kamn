import 'package:flutter/material.dart';
import 'package:kamn/presentation/shared/widget/error_image.dart';

import '../../../data/models/product.dart';
import '../../resources/styles_manager.dart';

import '../../shared/custom_scafffold/sliding_scaffold.dart';
import '../../shared/custom_scafffold/top_widget.dart';

class ProductView extends StatelessWidget {
  const ProductView(this.product, {Key? key}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
        title: product.name,
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TopWidget(
                    bottom: 25,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      child: ClipRRect(
                        borderRadius: StyleManager.border,
                        child: Column(
                          children: [
                            Hero(
                              tag: product.id,
                              child: ErrorImage(
                                product.img,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Padding(
                  padding: PaddingManager.p15,
                  child: productDetails(context),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ));
  }

  Widget productDetails(BuildContext context) => Container();
}
