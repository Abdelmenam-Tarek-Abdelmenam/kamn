import 'package:flutter/material.dart';

import '../../resources/string_manager.dart';
import '../../shared/custom_scafffold/sliding_scaffold.dart';

class StoreView extends StatelessWidget {
  const StoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(title: StringManger.store, child: Container());
  }
}
