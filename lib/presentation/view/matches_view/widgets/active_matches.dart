import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../data/models/matches.dart';
import '../../../resources/asstes_manager.dart';
import '../../../resources/string_manager.dart';

class ActiveMatchesWidget extends StatelessWidget {
  const ActiveMatchesWidget(this.matches, {Key? key}) : super(key: key);
  final List<ActiveMatch> matches;

  @override
  Widget build(BuildContext context) {
    return matches.isEmpty
        ? noMatches(context)
        : Wrap(
            children: matches.map((e) => ActiveMatchDesign(e)).toList(),
          );
  }

  Widget noMatches(BuildContext context) => Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 200,
              child: Lottie.asset(LottieManager.matches,
                  height: 250, fit: BoxFit.fitHeight)),
          Text(
            StringManger.noMatches,
            style: Theme.of(context).textTheme.displayMedium,
          )
        ],
      );
}

class ActiveMatchDesign extends StatelessWidget {
  const ActiveMatchDesign(this.activeMatch, {Key? key}) : super(key: key);
  final ActiveMatch activeMatch;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
