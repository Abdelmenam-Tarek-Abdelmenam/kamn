import 'package:flutter/material.dart';
import 'package:kamn/presentation/resources/styles_manager.dart';
import 'package:kamn/presentation/shared/widget/avatar.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';

import '../../../../data/models/ranked_user.dart';

class OtherRanked extends StatelessWidget {
  const OtherRanked(this.users, {Key? key}) : super(key: key);
  final List<Player> users;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: itemBuilder,
          separatorBuilder: (_, __) => Dividers.h10,
          itemCount: users.length),
    );
  }

  Widget itemBuilder(BuildContext context, int index) => InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.60),
              borderRadius: StyleManager.border),
          padding: PaddingManager.p4,
          child: Row(
            children: [
              SizedBox(
                width: 25,
                child: Center(
                  child: Text(
                    "${index + 4}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              ),
              Dividers.w10,
              Avatar(users[index].photoUrl ?? ""),
              Dividers.w10,
              Expanded(child: nameWidget(users[index].name!, context)),
              Dividers.w10,
              scoreWidget(users[index].score, context),
              Dividers.w10,
            ],
          ),
        ),
      );

  Widget nameWidget(String name, BuildContext context) => Text(
        name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontWeight: FontWeight.w100,
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 18,
            ),
      );
  Widget scoreWidget(int score, BuildContext context) => Text(
        score.toString(),
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w300,
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 26,
            ),
      );
}
