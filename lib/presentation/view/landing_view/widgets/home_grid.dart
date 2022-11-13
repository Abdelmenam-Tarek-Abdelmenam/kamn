import 'package:flutter/material.dart';
import 'package:kamn/presentation/resources/asstes_manager.dart';
import 'package:kamn/presentation/resources/routes_manger.dart';
import 'package:kamn/presentation/resources/string_manager.dart';
import 'package:kamn/presentation/view/landing_view/widgets/grid_item.dart';

import '../../../resources/styles_manager.dart';

class HomeGrid extends StatelessWidget {
  HomeGrid({Key? key}) : super(key: key);

  final List<GridItem> items = [
    GridItem(
        title: StringManger.match,
        image: LottieManager.match,
        route: Routes.match),
    GridItem(
        title: StringManger.coaches,
        image: LottieManager.coaches,
        route: Routes.coaches),
    GridItem(
        title: StringManger.benfits,
        image: LottieManager.benefits,
        route: Routes.benefits),
    GridItem(
        title: StringManger.store,
        image: LottieManager.store,
        route: Routes.store),
    GridItem(
        title: StringManger.tournaments,
        image: LottieManager.tournaments,
        route: Routes.match),
    GridItem(
        title: StringManger.leaderBoard,
        image: LottieManager.leaderBoard,
        route: Routes.leaderBoard),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: PaddingManager.p15,
        child: Center(
          child: Wrap(children: items.map((e) => GridItemDesign(e)).toList()),
        ),
      ),
    );
  }
}
