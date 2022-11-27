import 'package:flutter/material.dart';
import 'package:kamn/presentation/resources/styles_manager.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';
import 'package:kamn/presentation/shared/widget/rating_icons.dart';
import 'package:lottie/lottie.dart';

import '../../../../data/models/gym.dart';
import '../../../resources/asstes_manager.dart';
import '../../../resources/string_manager.dart';

class GymsList extends StatelessWidget {
  const GymsList(this.gyms, {Key? key}) : super(key: key);
  final List<Gym> gyms;

  @override
  Widget build(BuildContext context) {
    return gyms.isEmpty
        ? noGyms(context)
        : Wrap(
            children: gyms.map((e) => GymDesign(e)).toList(),
          );
  }

  Widget noGyms(BuildContext context) => Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 250,
              child: Lottie.asset(LottieManager.noGyms,
                  height: 300, fit: BoxFit.fitHeight)),
          Text(
            StringManger.noGyms,
            style: Theme.of(context).textTheme.displayMedium,
          )
        ],
      );
}

class GymDesign extends StatelessWidget {
  const GymDesign(this.item, {Key? key}) : super(key: key);
  final Gym item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: PaddingManager.p15.copyWith(bottom: 5),
      width: double.infinity,
      padding: PaddingManager.p10,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.65),
        image: DecorationImage(
          image: NetworkImage(item.img),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
        ),
        borderRadius: StyleManager.border,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              item.name,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 25,
                        ),
                        Dividers.w10,
                        Expanded(
                          child: Text(
                            item.address,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        )
                      ],
                    ),
                    Dividers.h5,
                    Row(
                      children: [
                        const Icon(Icons.group, size: 25),
                        Dividers.w10,
                        Text(
                          item.type.toString(),
                          style: Theme.of(context).textTheme.headlineMedium,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: PaddingManager.p4,
                  child: FittedBox(child: Text(item.price.toString())),
                ),
              )
            ],
          ),
          RatingIcons(item.rating),
          Center(
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                  foregroundColor:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.7)),
              onPressed: () {},
              label: const Text("Show more"),
              icon: const Icon(
                Icons.send,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
