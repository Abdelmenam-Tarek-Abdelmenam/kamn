import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/bloc/coaches_bloc/coaches_bloc.dart';
import 'package:kamn/data/models/app_user.dart';
import 'package:kamn/data/models/coach.dart';
import 'package:lottie/lottie.dart';

import '../../../resources/asstes_manager.dart';
import '../../../resources/string_manager.dart';

class CoachesList extends StatelessWidget {
  const CoachesList(this.coaches, {Key? key}) : super(key: key);
  final List<Coach> coaches;

  @override
  Widget build(BuildContext context) {
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
          : Wrap(
              children: coaches.map((e) => CoachDesign(e)).toList(),
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
    return Container();
  }
}
