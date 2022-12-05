import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamn/data/models/ranked_user.dart';
import 'package:kamn/presentation/shared/widget/avatar.dart';

import '../../../shared/widget/gradient_icon.dart';

class TopRanked extends StatelessWidget {
  const TopRanked(this.topRanked, {Key? key}) : super(key: key);
  final List<Player> topRanked;
  Player get firstRank => topRanked[0];
  Player get secondRank => topRanked[1];
  Player get thirdRank => topRanked[2];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [rank2(context), rank1(context), rank3(context)],
    );
  }

  Widget rank1(BuildContext context) => Column(
        children: [
          const GradientIcon(FontAwesomeIcons.crown, 35,
              LinearGradient(colors: [Colors.orange, Colors.yellow])),
          Avatar(
            firstRank.photoUrl ?? "",
            width: 100,
          ),
          scoreWidget(firstRank.score, context),
          nameWidget(firstRank.name!, context)
        ],
      );
  Widget rank2(BuildContext context) => Column(
        children: [
          Text(
            "2",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 0.8,
                color: Theme.of(context).colorScheme.onSurface),
          ),
          const Icon(Icons.circle, size: 15, color: Colors.greenAccent),
          Avatar(
            secondRank.photoUrl ?? "",
            width: 75,
          ),
          scoreWidget(secondRank.score, context),
          nameWidget(secondRank.name!, context)
        ],
      );
  Widget rank3(BuildContext context) => Column(
        children: [
          Text(
            "3",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 0.8,
                color: Theme.of(context).colorScheme.onSurface),
          ),
          const Icon(Icons.circle, size: 15, color: Colors.blue),
          Avatar(
            thirdRank.photoUrl ?? "",
            width: 75,
          ),
          scoreWidget(thirdRank.score, context),
          nameWidget(thirdRank.name!, context)
        ],
      );

  Widget nameWidget(String name, BuildContext context) => Visibility(
        visible: name.isNotEmpty,
        child: Text(
          name,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontWeight: FontWeight.w100,
                height: 1,
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 12,
              ),
        ),
      );
  Widget scoreWidget(int score, BuildContext context) => Visibility(
        visible: score != 0,
        child: Text(
          score.toString(),
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w300,
                height: 1.1,
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 26,
              ),
        ),
      );
}
