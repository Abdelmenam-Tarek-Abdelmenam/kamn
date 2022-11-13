import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/bloc/auth_bloc/auth_status_bloc.dart';
import 'package:kamn/data/models/app_user.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';

import '../../../resources/string_manager.dart';
import '../../../resources/styles_manager.dart';

class UserChoice extends StatelessWidget {
  const UserChoice(this.choice, {Key? key}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            choice == Choice.category
                ? StringManger.category
                : StringManger.game,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 20),
          ),
        ),
        Dividers.w10,
        Expanded(
          flex: 2,
          child: borderContainer(
              context,
              borderContainer(
                  context,
                  choice == Choice.category
                      ? CategoryItems<UserCategory>(
                          context.watch<AuthBloc>().state.category)
                      : CategoryItems<Games>(
                          context.watch<AuthBloc>().state.game))),
        )
      ],
    );
  }

  Widget borderContainer(BuildContext context, Widget child) => Container(
        padding: PaddingManager.p4,
        decoration: BoxDecoration(
            borderRadius: StyleManager.border,
            border: Border.all(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                width: 1)),
        child: child,
      );
}

class CategoryItems<T> extends StatelessWidget {
  const CategoryItems(this.category, {Key? key}) : super(key: key);
  final T category;

  @override
  Widget build(BuildContext context) {
    List list = T == UserCategory ? UserCategory.values : Games.values;

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, i) => itemBuilder(context, list[i]),
        itemCount: list.length);
  }

  Widget itemBuilder(BuildContext context, dynamic item) {
    return InkWell(
      onTap: () {
        if (T == UserCategory) {
          context.read<AuthBloc>().add(ChangeUserCategoryEvent(item));
        } else {
          context.read<AuthBloc>().add(ChangeUserGameEvent(item));
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
        color: item == category
            ? Theme.of(context).colorScheme.onPrimary.withOpacity(0.5)
            : null,
        child: Row(
          children: [
            Text(
              item.toString(),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 16,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Choice { category, game }
