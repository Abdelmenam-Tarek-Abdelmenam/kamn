import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamn/data/models/ranked_user.dart';
import 'package:kamn/presentation/shared/widget/avatar.dart';

import '../../../shared/widget/gradient_icon.dart';

class TopRanked extends StatelessWidget {
  TopRanked({Key? key}) : super(key: key);
  final RankedUser firstRank =
      RankedUser(name: "Mon3m", id: "id", img: testImage1, score: 120);
  final RankedUser secondRank =
      RankedUser(name: "Hazem", id: "id", img: testImage4, score: 100);
  final RankedUser thirdRank =
      RankedUser(name: "Sara", id: "id", img: testImage3, score: 80);

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
            firstRank.img,
            width: 100,
          ),
          scoreWidget(firstRank.score, context),
          nameWidget(firstRank.name, context)
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
            secondRank.img,
            width: 75,
          ),
          scoreWidget(secondRank.score, context),
          nameWidget(secondRank.name, context)
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
            thirdRank.img,
            width: 75,
          ),
          scoreWidget(thirdRank.score, context),
          nameWidget(thirdRank.name, context)
        ],
      );

  Widget nameWidget(String name, BuildContext context) => Text(
        name,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontWeight: FontWeight.w100,
              height: 1,
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 12,
            ),
      );
  Widget scoreWidget(int score, BuildContext context) => Text(
        score.toString(),
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w300,
              height: 1.1,
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 26,
            ),
      );
}
