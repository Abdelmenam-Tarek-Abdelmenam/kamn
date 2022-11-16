import 'package:flutter/material.dart';

import '../../resources/string_manager.dart';
import '../../shared/custom_scafffold/sliding_scaffold.dart';
import '../../shared/widget/loading_text.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
        title: StringManger.userPage,
        child: const Expanded(child: Center(child: LoadingText())));
  }
}
