import 'package:flutter/material.dart';
import 'package:kamn/data/models/coach.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';

import '../../resources/styles_manager.dart';
import '../../shared/custom_scafffold/sliding_scaffold.dart';
import '../../shared/custom_scafffold/top_widget.dart';
import '../../shared/details_widget.dart';
import '../../shared/widget/avatar.dart';

class CoachDetailsView extends StatelessWidget {
  const CoachDetailsView(this.coach, {Key? key}) : super(key: key);
  final Coach coach;
  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
      tabs: const [
        Text("Description"),
        Text("Consultation"),
      ],
      title: "Coach ${coach.name}",
      action: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.call),
      ),
      child: Expanded(
        child: TabBarView(
          children: [description(context), consultation(context)],
        ),
      ),
    );
  }

  Widget description(BuildContext context) => ListView(
        children: [
          topImage(context),
          Padding(
            padding: PaddingManager.p10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackGround(
                  child: Column(
                    children: [
                      Text(
                        "Overview",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 16),
                      ),
                      Dividers.h5,
                      Text(
                        coach.description,
                        // textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                            color: Theme.of(context).colorScheme.onPrimary),
                      )
                    ],
                  ),
                ),
                Dividers.h10,
                Text(
                  "Reviews",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 18),
                ),
                Dividers.h5,
                ReviewList(coach.reviews),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          )
        ],
      );

  Widget consultation(BuildContext context) => Padding(
        padding: PaddingManager.p10,
        child: ListView(
          children: [
            PriceList(coach.subscriptions),
            Dividers.h10,
            BackGround(
              child: Column(
                children: [
                  Text(
                    "Online Consultation",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 16),
                  ),
                  Dividers.h5,
                  Text(
                    coach.description,
                    // textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                        color: Theme.of(context).colorScheme.onPrimary),
                  )
                ],
              ),
            ),
            Dividers.h10,
            BackGround(
              child: Column(
                children: [
                  Text(
                    "Offline Consultation",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 16),
                  ),
                  Dividers.h5,
                  Text(
                    coach.description,
                    // textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                        color: Theme.of(context).colorScheme.onPrimary),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      );

  Widget topImage(BuildContext context) => TopWidget(
      bottom: 10,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Hero(
                tag: coach.id,
                child: Avatar(
                  coach.img,
                  width: 100,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: FilledButton.tonalIcon(
                  icon: const Icon(
                    Icons.star_rate_outlined,
                    size: 25,
                  ),
                  onPressed: () {},
                  label: Text(coach.rating.toString())),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Text(
              coach.position,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontWeight: FontWeight.w100,
                    height: 1,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 14,
                  ),
            ),
          )
        ],
      ));
}
