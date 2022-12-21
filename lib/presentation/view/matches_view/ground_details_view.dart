import 'package:flutter/material.dart';
import 'package:kamn/data/models/matches.dart';
import 'package:kamn/presentation/shared/custom_scafffold/sliding_scaffold.dart';
import 'package:kamn/presentation/shared/details_widget.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';

import '../../resources/styles_manager.dart';

class GroundDetailsView extends StatelessWidget {
  const GroundDetailsView(this.ground, {Key? key}) : super(key: key);
  final Ground ground;

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
      title: ground.name,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
        child: const Icon(
          Icons.book_online,
        ),
        onPressed: () {},
      ),
      action: IconButton(
        icon: const Icon(Icons.call),
        onPressed: () {},
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: PaddingManager.p15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              priceText(context),
              Dividers.h10,
              hoursText(context),
              Dividers.h10,
              FacilitiesList(ground.amenities),
              Dividers.h10,
              Text(
                "Photos",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 18),
              ),
              Dividers.h5,
              ImagesList(ground.images),
              Dividers.h10,
              AddressBox(ground.address, ground.lat, ground.lon),
              Dividers.h10,
              Text(
                "Reviews",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 18),
              ),
              Dividers.h5,
              ReviewList(ground.reviews),
            ],
          ),
        ),
      ),
    );
  }

  Widget priceText(BuildContext context) => BackGround(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ground.type.toString(),
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 18),
          ),
          Text(
            "${ground.price} L.E./hour",
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 18),
          ),
        ],
      ));

  Widget hoursText(BuildContext context) => BackGround(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hours",
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 18),
          ),
          Text(
            ground.activeHours,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 18),
          ),
        ],
      ));
}
