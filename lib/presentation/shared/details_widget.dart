import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kamn/data/repositories/lanucher_extentions.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';
import 'package:lottie/lottie.dart';

import '../resources/asstes_manager.dart';
import '../resources/styles_manager.dart';
import 'customs_icons.dart';
import 'widget/error_image.dart';

class FacilitiesList extends StatelessWidget {
  const FacilitiesList(this.amenities, {Key? key}) : super(key: key);
  final List<String> amenities;

  @override
  Widget build(BuildContext context) {
    return BackGround(
        child: Column(
      children: [
        Text(
          "Facilities",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Theme.of(context).colorScheme.onSecondary),
        ),
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          spacing: 2,
          children: amenities
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
  }
}

class AddressBox extends StatelessWidget {
  const AddressBox(this.address, this.lat, this.lon, {Key? key})
      : super(key: key);
  final String address;
  final double lat;
  final double lon;

  @override
  Widget build(BuildContext context) {
    return BackGround(
        child: Row(
      children: [
        Expanded(
            child: Text(
          address,
          textAlign: TextAlign.start,
          style:
              Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 16),
        )),
        InkWell(
          onTap: () => launchMapsUrl(lat, lon),
          child: CircleAvatar(
            backgroundColor:
                Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
            child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Lottie.asset(LottieManager.location)),
          ),
        )
      ],
    ));
  }
}

class ImagesList extends StatelessWidget {
  const ImagesList(this.images, {Key? key}) : super(key: key);
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: PaddingManager.p10,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
        borderRadius: StyleManager.border,
      ),
      child: images.isEmpty
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
                    items: images
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
  }
}

class ReviewList extends StatelessWidget {
  const ReviewList(this.reviews, {Key? key}) : super(key: key);
  final List<String> reviews;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: PaddingManager.p10,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
        borderRadius: StyleManager.border,
      ),
      child: reviews.isEmpty
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
                    items: reviews
                        .map(
                          (e) => Container(
                            padding: PaddingManager.p10,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
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
}

class BackGround extends StatelessWidget {
  const BackGround({required this.child, this.padding, super.key});
  final EdgeInsets? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? PaddingManager.p10,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.95),
        borderRadius: StyleManager.border,
      ),
      child: child,
    );
  }
}

class PriceList extends StatefulWidget {
  const PriceList(this.subscription, {Key? key}) : super(key: key);
  final Map<String, dynamic> subscription;

  @override
  State<PriceList> createState() => _PriceListState();
}

class _PriceListState extends State<PriceList> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return BackGround(
          padding: EdgeInsets.zero,
          child: Center(
            child: ExpansionPanelList(
              elevation: 0.0,
              animationDuration: const Duration(seconds: 1),
              expandedHeaderPadding: EdgeInsets.zero,
              expansionCallback: (int index, bool status) {
                active = !status;
                setState(() {});
              },
              children: [
                ExpansionPanel(
                    canTapOnHeader: true,
                    backgroundColor: Colors.transparent,
                    isExpanded: active,
                    headerBuilder: (context, _) => Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              " Subscriptions",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                    body: Column(
                      children: widget.subscription.keys
                          .map((key) => ListTile(
                                iconColor:
                                    Theme.of(context).colorScheme.primary,
                                // contentPadding: EdgeInsets.zero,
                                dense: true,
                                visualDensity: const VisualDensity(
                                    vertical: -2), // to compact
                                tileColor: Theme.of(context)
                                    .colorScheme
                                    .onPrimary
                                    .withOpacity(0.65),
                                shape: Border.symmetric(
                                    horizontal: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary)),
                                style: ListTileStyle.drawer,
                                leading: const Icon(Icons.attach_money),
                                title: Text(key,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(fontSize: 16)),
                                trailing: Text(
                                    "${widget.subscription[key]!} EGP",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(fontSize: 14)),
                              ))
                          .toList(),
                    )),
              ],
            ),
          ));
    });
  }
}
