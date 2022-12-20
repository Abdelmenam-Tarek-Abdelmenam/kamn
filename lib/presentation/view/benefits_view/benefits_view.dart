import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/bloc/benfits_bloc/benfits_bloc.dart';
import 'package:kamn/data/models/benfits.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../bloc/status.dart';
import '../../resources/string_manager.dart';
import '../../shared/custom_scafffold/sliding_scaffold.dart';
import '../../shared/widget/error_widget.dart';
import '../../shared/widget/loading_text.dart';
import 'widgets/benefits_widget.dart';

class BenefitsView extends StatelessWidget {
  BenefitsView({Key? key}) : super(key: key);
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
      title: StringManger.benfits,
      bottomNavigationBar:
          bottomBar(context, context.watch<BenfitsBloc>().state.type),
      child: Expanded(
        child: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: false,
          header: const WaterDropHeader(),
          onRefresh: () {
            BenfitsBloc bloc = context.read<BenfitsBloc>();
            switch (bloc.state.type) {
              case BenfitsViewType.medical:
                bloc.add(const GetBenefitData(medicalModel));
                break;
              case BenfitsViewType.nutrition:
                bloc.add(const GetBenefitData(nutritionModel));
                break;
              case BenfitsViewType.sport:
                bloc.add(const GetBenefitData(sportsModel));
                break;
            }
          },
          child: ListView(
            children: [
              BlocBuilder<BenfitsBloc, BenfitsState>(
                  // buildWhen: (prev, next) => prev.type != next.type,
                  builder: (context, state) {
                switch (state.status) {
                  case BlocStatus.idle:
                    return BenfitsWidget(state.benfits.data);
                  case BlocStatus.gettingData:
                    return const LoadingText();
                  case BlocStatus.getData:
                    endRefresh();
                    return BenfitsWidget(state.benfits.data);
                  case BlocStatus.error:
                    endRefresh();
                    return const ErrorView();
                }
              }),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> bottomBar(BuildContext context, BenfitsViewType type) =>
      BenfitsViewType.values
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
                  label: Text(
                    i.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w100, fontSize: 14),
                  ),
                  onPressed: () {
                    context.read<BenfitsBloc>().add(ChangeViewTypeEvent(i));
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
