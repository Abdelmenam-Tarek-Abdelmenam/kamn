import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kamn/data/models/matches.dart';
import 'package:kamn/presentation/resources/asstes_manager.dart';
import 'package:kamn/presentation/shared/custom_scafffold/sliding_scaffold.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';
import 'package:kamn/presentation/shared/widget/error_image.dart';

import '../../../data/repositories/lanucher_extentions.dart';
import '../../resources/styles_manager.dart';
import '../../shared/customs_icons.dart';

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
              icons(context),
              Dividers.h10,
              Text(
                "Photos",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 18),
              ),
              Dividers.h5,
              imagesList(context),
              Dividers.h10,
              addressText(context),
              Dividers.h10,
              Text(
                "Reviews",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 18),
              ),
              Dividers.h5,
              reviewsList(context),
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

  Widget icons(BuildContext context) => BackGround(
          child: Column(
        children: [
          Text(
            "Amenities",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).colorScheme.onSecondary),
          ),
          Wrap(
            alignment: WrapAlignment.spaceAround,
            children: ground.amenities
                .map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomIcon(
                            "$iconsPath$e.svg",
                            width: 40,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          Dividers.h10,
                          Text(e,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(fontSize: 14)),
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ));

  Widget addressText(BuildContext context) => BackGround(
          child: Row(
        children: [
          Expanded(
              child: Text(
            ground.address,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 16),
          )),
          IconButton(
              onPressed: () => launchMapsUrl(ground.lat, ground.lon),
              icon: const Icon(Icons.location_on_outlined))
        ],
      ));

  Widget imagesList(BuildContext context) => Container(
        width: double.infinity,
        padding: PaddingManager.p10,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
          borderRadius: StyleManager.border,
        ),
        child: ground.images.isEmpty
            ? Center(
                child: Text(
                "No photos yet",
                style: Theme.of(context).textTheme.labelSmall,
              ))
            : Column(
                children: [
                  SizedBox(
                    height: 120,
                    width: MediaQuery.of(context).size.width - 100,
                    child: CarouselSlider(
                      carouselController: CarouselController(),
                      options: CarouselOptions(
                        autoPlay: false,
                      ),
                      items: ground.images
                          .map((e) => ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: ErrorImage(
                                  e,
                                  fit: BoxFit.fitHeight,
                                ),
                              ))
                          .toList(),
                    ),
                  )
                ],
              ),
      );

  Widget reviewsList(BuildContext context) => Container(
        width: double.infinity,
        padding: PaddingManager.p10,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
          borderRadius: StyleManager.border,
        ),
        child: ground.images.isEmpty
            ? Center(
                child: Text(
                "No Reviews yet",
                style: Theme.of(context).textTheme.labelSmall,
              ))
            : Column(
                children: [
                  SizedBox(
                    height: 80,
                    width: MediaQuery.of(context).size.width - 100,
                    child: CarouselSlider(
                      carouselController: CarouselController(),
                      options: CarouselOptions(
                          autoPlay: false, enableInfiniteScroll: false),
                      items: ground.reviews
                          .map(
                            (e) => Container(
                              padding: PaddingManager.p10,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: StyleManager.border,
                                  border: Border.all(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 1)),
                              child: Center(
                                  child: SingleChildScrollView(
                                      child: Text(
                                e,
                                style: Theme.of(context).textTheme.labelSmall,
                              ))),
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
      );
}

class BackGround extends StatelessWidget {
  const BackGround({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: PaddingManager.p10,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.95),
        borderRadius: StyleManager.border,
      ),
      child: child,
    );
  }
}
