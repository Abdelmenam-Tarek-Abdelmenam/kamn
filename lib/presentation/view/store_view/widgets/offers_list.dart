import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kamn/data/models/product.dart';

class OffersList extends StatelessWidget {
  OffersList({Key? key}) : super(key: key);
  final List<OfferItem> offers = [];

  @override
  Widget build(BuildContext context) {
    return offers.isEmpty
        ? noOffers(context)
        : CarouselSlider(
            options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enableInfiniteScroll: offers.length != 1),
            items: offers.map((e) => offerCard(context, e)).toList(),
          );
  }

  Widget noOffers(BuildContext context) => const Text("No offers");

  Widget offerCard(
    BuildContext context,
    OfferItem item,
  ) {
    return Text(item.product.name);
  }
}
