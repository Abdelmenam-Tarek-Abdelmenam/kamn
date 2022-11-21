import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/bloc/matches_bloc/matches_bloc.dart';
import 'package:kamn/presentation/resources/string_manager.dart';
import 'package:kamn/presentation/shared/custom_scafffold/sliding_scaffold.dart';

import 'widgets/active_matches.dart';
import 'widgets/grounds.dart';

class MatchesView extends StatelessWidget {
  const MatchesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
        title: StringManger.match,
        floatingActionButton: FloatingActionButton(
            tooltip: "Community",
            backgroundColor:
                Theme.of(context).colorScheme.onPrimary.withOpacity(0.65),
            elevation: 0,
            child: Icon(
              Icons.chat,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
            ),
            onPressed: () {}),
        bottomNavigationBar:
            bottomBar(context, context.watch<MatchesBloc>().state.type),
        child: Expanded(
          child: ListView(
            children: [
              Row(
                children: [
                  Checkbox(
                      checkColor: Theme.of(context).colorScheme.primary,
                      activeColor: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.8),
                      value: context.watch<MatchesBloc>().state.userAvailable,
                      onChanged: (val) {
                        context
                            .read<MatchesBloc>()
                            .add(ChangeUserCheckEvent(val!));
                      }),
                  Text(
                    "I'm free all time any place",
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ],
              ),
              BlocBuilder<MatchesBloc, MatchesState>(
                // buildWhen: (prev, next) => prev.type != next.type,
                builder: (context, state) {
                  if (state.type == MatchesViewType.grounds) {
                    return GroundsWidget(state.grounds);
                  } else {
                    return ActiveMatchesWidget(state.matches);
                  }
                },
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ));
  }

  List<Widget> bottomBar(BuildContext context, MatchesViewType type) =>
      MatchesViewType.values
          .map((i) => SizedBox(
                width: 120,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.65),
                      backgroundColor: i == type
                          ? Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.2)
                          : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Icon(
                      i.toIcon(),
                      size: 25,
                    ),
                  ),
                  label: Text(
                    i.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w100, fontSize: 16),
                  ),
                  onPressed: () {
                    context.read<MatchesBloc>().add(ChangeViewTypeEvent(i));
                  },
                ),
              ))
          .toList();
}
