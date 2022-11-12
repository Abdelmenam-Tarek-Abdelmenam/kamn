import 'package:flutter/material.dart';

import '../../resources/string_manager.dart';
import '../../shared/custom_scafffold/sliding_scaffold.dart';

class CustomerSupportView extends StatelessWidget {
  const CustomerSupportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
        title: StringManger.customerSupport, child: Container());
  }
}
