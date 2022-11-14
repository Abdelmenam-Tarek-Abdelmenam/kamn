import 'package:flutter/material.dart';
import 'package:kamn/presentation/view/store_view/widgets/offers_list.dart';

import '../../resources/string_manager.dart';
import '../../resources/styles_manager.dart';

import '../../shared/custom_scafffold/sliding_scaffold.dart';
import '../../shared/custom_scafffold/top_widget.dart';
import 'widgets/products_list.dart';

class StoreView extends StatelessWidget {
  const StoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
        title: StringManger.store,
        child: Expanded(
          child: SingleChildScrollView(
            // physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                TopWidget(bottom: 20, child: OffersList()),
                Padding(
                  padding: PaddingManager.p15,
                  child: ProductList(),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ));
  }
}
