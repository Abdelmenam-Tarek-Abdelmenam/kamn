import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kamn/presentation/resources/styles_manager.dart';

import '../../resources/string_manager.dart';
import '../../shared/custom_scafffold/sliding_scaffold.dart';
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
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.65),
                        // boxShadow: StyleManager.smallShadow,
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(60))),
                    child: Padding(
                      padding: PaddingManager.p8.copyWith(bottom: 10),
                      child: TopRanked(),
                    ),
                  ),
                ),
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
