import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/presentation/resources/styles_manager.dart';
import 'package:kamn/presentation/shared/widget/loading_text.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../bloc/leader_board_bloc/leader_board_bloc.dart';
import '../../../bloc/status.dart';
import '../../resources/string_manager.dart';
import '../../shared/custom_scafffold/sliding_scaffold.dart';
import '../../shared/custom_scafffold/top_widget.dart';
import '../../shared/widget/error_widget.dart';
import 'widgets/other_ranked.dart';
import 'widgets/top_ranked.dart';

class LeaderBoardView extends StatelessWidget {
  LeaderBoardView({Key? key}) : super(key: key);
  final RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
        title: StringManger.leaderBoard,
        child: Expanded(
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: false,
            header: const WaterDropHeader(),
            onRefresh: () =>
                context.read<LeaderBoardBloc>().add(GetBoardsEvent()),
            controller: _refreshController,
            child: SingleChildScrollView(
              // physics: const BouncingScrollPhysics(),
              child: BlocBuilder<LeaderBoardBloc, LeaderBoardState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      TopWidget(bottom: 10, child: TopRanked(state.topRanked)),
                      Padding(
                        padding: PaddingManager.p15,
                        child: rightBuild(context, state),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }

  Widget rightBuild(BuildContext context, LeaderBoardState state) {
    switch (state.status) {
      case BlocStatus.idle:
        return OtherRanked(state.bottomRanked);
      case BlocStatus.gettingData:
        return const LoadingText();
      case BlocStatus.getData:
        endRefresh();
        return OtherRanked(state.bottomRanked);
      case BlocStatus.error:
        endRefresh();
        return const ErrorView();
    }
  }

  void endRefresh() {
    Future.delayed(const Duration(milliseconds: 10)).then((value) {
      if (_refreshController.isRefresh) _refreshController.refreshCompleted();
      if (_refreshController.isLoading) _refreshController.loadComplete();
    });
  }
}
