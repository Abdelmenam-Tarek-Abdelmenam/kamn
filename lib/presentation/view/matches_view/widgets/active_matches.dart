import 'package:flutter/material.dart';
import 'package:kamn/presentation/resources/styles_manager.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';
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
  const ActiveMatchDesign(this.item, {Key? key}) : super(key: key);
  final ActiveMatch item;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 2 - 20;

    return Container(
      decoration: BoxDecoration(
        borderRadius: StyleManager.border,
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.65),
      ),
      height: 134,
      width: width > 200 ? 200 : width,
      margin: PaddingManager.p8,
      padding: PaddingManager.p8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              item.playGroundName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 16),
            ),
          ),
          Dividers.h5,
          FittedBox(
            child: Text(
              "${item.game} - Available ${item.availableCount} ",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 16),
            ),
          ),
          Dividers.h5,
          Text(
            item.time,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:
                Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 14),
          ),
          Center(
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 14),
                padding: PaddingManager.p4.copyWith(right: 10, left: 10),
              ),
              onPressed: () {},
              label: const Text("Join game"),
              icon: const Icon(
                Icons.play_arrow_rounded,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
