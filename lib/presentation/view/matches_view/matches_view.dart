import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamn/bloc/matches_bloc/matches_bloc.dart';
import 'package:kamn/presentation/resources/string_manager.dart';
import 'package:kamn/presentation/shared/custom_scafffold/sliding_scaffold.dart';
import 'package:kamn/presentation/view/matches_view/widgets/active_dialog.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../bloc/status.dart';
import '../../shared/widget/error_widget.dart';
import '../../shared/widget/loading_text.dart';
import 'widgets/active_matches.dart';
import 'widgets/grounds.dart';

class MatchesView extends StatelessWidget {
  MatchesView({Key? key}) : super(key: key);
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
        title: StringManger.match,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
            backgroundColor:
                context.watch<PlayBloc>().state.userAvailable != null
                    ? Theme.of(context).colorScheme.secondary.withOpacity(0.8)
                    : Theme.of(context).colorScheme.onPrimary.withOpacity(0.65),
            elevation: 0,
            child: Icon(
              FontAwesomeIcons.personRunning,
              color: context.watch<PlayBloc>().state.userAvailable != null
                  ? Theme.of(context).colorScheme.onPrimary.withOpacity(0.7)
                  : Theme.of(context).colorScheme.primary.withOpacity(0.7),
            ),
            onPressed: () => setActive(context)),
        bottomNavigationBar:
            bottomBar(context, context.watch<PlayBloc>().state.type),
        child: Expanded(
          child: ListView(
            children: [
              BlocBuilder<PlayBloc, PlayState>(
                builder: (context, state) {
                  if (state.type == MatchesViewType.grounds) {
                    switch (state.groundStatus) {
                      case BlocStatus.idle:
                        return GroundsWidget(state.grounds);
                      case BlocStatus.gettingData:
                        return const LoadingText();
                      case BlocStatus.getData:
                        endRefresh();
                        return GroundsWidget(state.grounds);
                      case BlocStatus.error:
                        endRefresh();
                        return const ErrorView();
                    }
                  } else if (state.type == MatchesViewType.active) {
                    switch (state.matchesStatus) {
                      case BlocStatus.idle:
                        return ActiveMatchesWidget(state.matches);
                      case BlocStatus.gettingData:
                        return const LoadingText();
                      case BlocStatus.getData:
                        endRefresh();
                        return ActiveMatchesWidget(state.matches);
                      case BlocStatus.error:
                        endRefresh();
                        return const ErrorView();
                    }
                  } else {
                    return const LoadingText();
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
                width: 100,
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
                  icon: Icon(
                    i.toIcon(),
                    size: 20,
                  ),
                  label: FittedBox(
                    child: Text(
                      i.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w100, fontSize: 14),
                    ),
                  ),
                  onPressed: () {
                    context.read<PlayBloc>().add(ChangeViewTypeEvent(i));
                  },
                ),
              ))
          .toList();

  void communityCallback(BuildContext context) {}

  void setActive(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const ActiveDialog();
        });
  }

  void endRefresh() {
    Future.delayed(const Duration(milliseconds: 20)).then((value) {
      print("Refresh complete");
      if (_refreshController.isRefresh) _refreshController.refreshCompleted();
      if (_refreshController.isLoading) _refreshController.loadComplete();
    });
  }
}
