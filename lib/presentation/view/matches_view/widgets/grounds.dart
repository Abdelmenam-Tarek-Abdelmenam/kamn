import 'package:flutter/material.dart';
import 'package:kamn/presentation/resources/asstes_manager.dart';
import 'package:kamn/presentation/resources/string_manager.dart';
import 'package:lottie/lottie.dart';

import '../../../../data/models/matches.dart';

class GroundsWidget extends StatelessWidget {
  const GroundsWidget(this.grounds, {Key? key}) : super(key: key);
  final List<Ground> grounds;

  @override
  Widget build(BuildContext context) {
    return grounds.isEmpty
        ? noGrounds(context)
        : Wrap(
            children: grounds.map((e) => GroundDesign(e)).toList(),
          );
  }

  Widget noGrounds(BuildContext context) => Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 250,
              child: Lottie.asset(LottieManager.ground,
                  height: 250, fit: BoxFit.fitHeight)),
          Text(
            StringManger.noGrounds,
            style: Theme.of(context).textTheme.displayMedium,
          )
        ],
      );
}

class GroundDesign extends StatelessWidget {
  const GroundDesign(this.ground, {Key? key}) : super(key: key);
  final Ground ground;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
