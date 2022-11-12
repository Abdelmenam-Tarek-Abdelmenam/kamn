import 'package:flutter/material.dart';
import 'package:kamn/presentation/resources/string_manager.dart';
import 'package:kamn/presentation/shared/custom_scafffold/sliding_scaffold.dart';

class MatchesView extends StatelessWidget {
  const MatchesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(title: StringManger.match, child: Container());
  }
}
