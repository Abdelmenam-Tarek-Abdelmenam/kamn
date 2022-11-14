import 'package:flutter/material.dart';
import 'package:kamn/presentation/resources/styles_manager.dart';

import '../../resources/string_manager.dart';
import '../../shared/custom_scafffold/sliding_scaffold.dart';
import '../../shared/custom_scafffold/top_widget.dart';
import 'widgets/other_ranked.dart';
import 'widgets/top_ranked.dart';

class LeaderBoardView extends StatelessWidget {
  const LeaderBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
        title: StringManger.leaderBoard,
        child: Expanded(
          child: SingleChildScrollView(
            // physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                TopWidget(bottom: 10, child: TopRanked()),
                Padding(
                  padding: PaddingManager.p15,
                  child: OtherRanked(),
                )
              ],
            ),
          ),
        ));
  }
}
