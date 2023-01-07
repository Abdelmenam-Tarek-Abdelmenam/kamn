import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/bloc/coaches_bloc/coaches_bloc.dart';
import 'package:kamn/data/models/app_user.dart';
import 'package:kamn/data/models/coach.dart';
import 'package:kamn/data/models/show_data.dart';
import 'package:kamn/presentation/resources/routes_manger.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';
import 'package:kamn/presentation/shared/widget/error_image.dart';
import 'package:lottie/lottie.dart';

import '../../../resources/asstes_manager.dart';
import '../../../resources/string_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../shared/widget/rating_icons.dart';

class CoachesList extends StatelessWidget {
  const CoachesList(this.coaches, {Key? key}) : super(key: key);
  final ShowData<Coach> coaches;

  @override
  Widget build(BuildContext context) {
    Games filter = context.read<CoachesBloc>().state.filter;
    return Column(children: [
      Wrap(
        children: Games.values
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 200),
                    child: FilterChip(
                        // backgroundColor: Colors.transparent,
                        onSelected: (_) {
                          context
                              .read<CoachesBloc>()
                              .add(ChangeViewFilterEvent(e));
                        },
                        label: Text(e.toString()),
                        selected:
                            context.read<CoachesBloc>().state.filter == e),
                  ),
                ))
            .toList(),
      ),
      coaches.isEmpty
          ? noCoaches(context)
          : Column(
              children: coaches.data
                  .map((e) => Visibility(
                      visible: filter == Games.all || e.game == filter,
                      child: CoachDesign(e)))
                  .toList(),
            )
    ]);
  }

  Widget noCoaches(BuildContext context) => Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 250,
              child: Lottie.asset(LottieManager.noCoaches,
                  height: 250, fit: BoxFit.fitHeight)),
          Text(
            StringManger.noCoaches,
            style: Theme.of(context).textTheme.displayMedium,
          )
        ],
      );
}

class CoachDesign extends StatelessWidget {
  const CoachDesign(this.item, {Key? key}) : super(key: key);
  final Coach item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0).copyWith(bottom: 0),
      padding: PaddingManager.p8,
      // height: 120,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.65),
        borderRadius: StyleManager.border,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: item.id,
                child: ClipOval(
                  child: ErrorImage(
                    item.img,
                    height: 80,
                  ),
                ),
              ),
              Dividers.w10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${StringManger.coach} ${item.name}",
                      style: Theme.of(context).textTheme.displaySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Dividers.h5,
                    Text(
                      item.position,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    RatingIcons(item.rating),
                  ],
                ),
              )
            ],
          ),
          Dividers.h10,
          Column(
            children: [
              Dividers.horizontalLine,
              Row(
                children: [
                  customButton(context, StringManger.achievements, () {
                    Navigator.of(context)
                        .pushNamed(Routes.coachAchievements, arguments: item);
                  }),
                  const SizedBox(
                    height: 30,
                    child: Dividers.verticalLine,
                  ),
                  customButton(context, StringManger.details, () {
                    Navigator.of(context)
                        .pushNamed(Routes.coachDetails, arguments: item);
                  }),
                ],
              ),
              Dividers.horizontalLine,
            ],
          ),
        ],
      ),
    );
  }

  Widget customButton(
          BuildContext context, String label, void Function() onTab) =>
      Expanded(
        child: InkWell(
          onTap: onTab,
          child: SizedBox(
            height: 30,
            child: Center(
                child: Text(
              label,
              style: Theme.of(context).textTheme.labelSmall,
            )),
          ),
        ),
      );
}
