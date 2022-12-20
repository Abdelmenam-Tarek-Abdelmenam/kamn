import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../bloc/auth_bloc/auth_status_bloc.dart';
import '../../../bloc/coaches_bloc/coaches_bloc.dart';
import '../../../bloc/status.dart';
import '../../resources/string_manager.dart';

import '../../shared/custom_scafffold/sliding_scaffold.dart';
import '../../shared/widget/error_widget.dart';
import '../../shared/widget/loading_text.dart';
import 'widgets/coaches_list.dart';
import 'widgets/gyms_list.dart';

class CoachesView extends StatefulWidget {
  const CoachesView({Key? key}) : super(key: key);

  @override
  State<CoachesView> createState() => _CoachesViewState();
}

class _CoachesViewState extends State<CoachesView> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context
        .read<CoachesBloc>()
        .add(ChangeViewFilterEvent(context.read<AuthBloc>().state.game));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
        title: StringManger.coaches,
        floatingActionButton: FloatingActionButton(
            backgroundColor:
                Theme.of(context).colorScheme.onPrimary.withOpacity(0.65),
            elevation: 0,
            child: Icon(
              FontAwesomeIcons.map,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
            ),
            onPressed: () {}),
        bottomNavigationBar:
            bottomBar(context, context.watch<CoachesBloc>().state.type),
        child: Expanded(
          child: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            enablePullUp: false,
            header: const WaterDropHeader(),
            onRefresh: () {
              CoachesBloc bloc = context.read<CoachesBloc>();
              switch (bloc.state.type) {
                case CoachesType.coach:
                  bloc.add(const GetCoachesEvent());
                  break;
                case CoachesType.gym:
                  bloc.add(const GetGymsEvent());
                  break;
              }
            },
            child: ListView(
              children: [
                BlocBuilder<CoachesBloc, CoachesState>(
                  // buildWhen: (prev, next) => prev.type != next.type,
                  builder: (context, state) {
                    if (state.type == CoachesType.coach) {
                      switch (state.coachesStatus) {
                        case BlocStatus.idle:
                          return CoachesList(state.coaches);
                        case BlocStatus.gettingData:
                          return const LoadingText();
                        case BlocStatus.getData:
                          endRefresh();
                          return CoachesList(state.coaches);
                        case BlocStatus.error:
                          endRefresh();
                          return const ErrorView();
                      }
                    } else {
                      switch (state.gymStatus) {
                        case BlocStatus.idle:
                          return GymsList(state.gyms);
                        case BlocStatus.gettingData:
                          return const LoadingText();
                        case BlocStatus.getData:
                          endRefresh();
                          return GymsList(state.gyms);
                        case BlocStatus.error:
                          endRefresh();
                          return const ErrorView();
                      }
                    }
                  },
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ));
  }

  List<Widget> bottomBar(BuildContext context, CoachesType type) => CoachesType
      .values
      .map((i) => SizedBox(
            width: 120,
            child: TextButton.icon(
              style: TextButton.styleFrom(
                  foregroundColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.65),
                  backgroundColor: i == type
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
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
                style:
                    const TextStyle(fontWeight: FontWeight.w100, fontSize: 16),
              ),
              onPressed: () {
                context.read<CoachesBloc>().add(ChangeViewTypeEvent(i));
              },
            ),
          ))
      .toList();

  void endRefresh() {
    Future.delayed(const Duration(milliseconds: 20)).then((value) {
      if (_refreshController.isRefresh) _refreshController.refreshCompleted();
      if (_refreshController.isLoading) _refreshController.loadComplete();
    });
  }
}
