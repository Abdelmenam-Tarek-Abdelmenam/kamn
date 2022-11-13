import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';

import '../../../resources/routes_manger.dart';
import '../../../resources/string_manager.dart';

class BottomPanel extends StatelessWidget {
  BottomPanel({Key? key}) : super(key: key);

  final List<ListItem> items = [
    ListItem(
        title: StringManger.userPage,
        icon: FontAwesomeIcons.user,
        route: Routes.user),
    ListItem(
        title: StringManger.match,
        icon: FontAwesomeIcons.football,
        route: Routes.match),
    ListItem(
        title: StringManger.coaches,
        icon: FontAwesomeIcons.personSkating,
        route: Routes.coaches),
    ListItem(
        title: StringManger.benfits,
        icon: FontAwesomeIcons.award,
        route: Routes.benefits),
    ListItem(
        title: StringManger.store,
        icon: FontAwesomeIcons.store,
        route: Routes.store),
    ListItem(
        title: StringManger.tournaments,
        icon: FontAwesomeIcons.medal,
        route: Routes.match),
    ListItem(
        title: StringManger.leaderBoard,
        icon: Icons.leaderboard_outlined,
        route: Routes.leaderBoard),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, i) => ItemBuilder(items[i]),
        separatorBuilder: (_, __) => Dividers.horizontalLine,
        itemCount: items.length);
  }
}

class ItemBuilder extends StatelessWidget {
  const ItemBuilder(this.item, {Key? key}) : super(key: key);
  final ListItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        child: Row(
          children: [
            Icon(
              item.icon,
              size: 25,
              color: Theme.of(context).primaryColor,
            ),
            Dividers.w10,
            Text(
              item.title,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                  ),
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, item.route);
        },
      ),
    );
  }
}

class ListItem {
  String route;
  String title;
  IconData icon;

  ListItem({required this.route, required this.title, required this.icon});
}
