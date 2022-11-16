import 'package:flutter/material.dart';
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
              height: 300,
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
    return Container();
  }
}
