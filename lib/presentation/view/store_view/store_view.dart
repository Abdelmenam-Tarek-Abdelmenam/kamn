import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/bloc/store_bloc/store_bloc.dart';

import 'package:kamn/presentation/view/store_view/widgets/offers_list.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../bloc/status.dart';
import '../../resources/string_manager.dart';
import '../../resources/styles_manager.dart';

import '../../shared/custom_scafffold/sliding_scaffold.dart';
import '../../shared/custom_scafffold/top_widget.dart';
import '../../shared/widget/error_widget.dart';

import '../../shared/widget/loading_text.dart';
import 'widgets/products_list.dart';

class StoreView extends StatelessWidget {
  StoreView({Key? key}) : super(key: key);
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
        title: StringManger.store,
        child: Expanded(
          child: NotificationListener<ScrollEndNotification>(
            onNotification: (scrollEnd) {
              final metrics = scrollEnd.metrics;
              if (metrics.atEdge) {
                bool isTop = metrics.pixels == 0;
                if (!isTop) {
                  context.read<StoreBloc>().add(GetMoreStoreEvent());
                }
              }
              return true;
            },
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
              header: const WaterDropHeader(),
              onRefresh: () => context.read<StoreBloc>().add(GetStoreEvent()),
              controller: _refreshController,
              child: SingleChildScrollView(
                // physics: const BouncingScrollPhysics(),
                child: BlocBuilder<StoreBloc, StoreState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        TopWidget(bottom: 20, child: OffersList(state.offers)),
                        Padding(
                          padding: PaddingManager.p15,
                          child: rightBuild(context, state),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ));
  }

  Widget rightBuild(BuildContext context, StoreState state) {
    switch (state.status) {
      case BlocStatus.idle:
        return ProductList(state.products);
      case BlocStatus.gettingData:
        return const LoadingText();
      case BlocStatus.getData:
        endRefresh();
        return ProductList(state.products);
      case BlocStatus.error:
        endRefresh();
        return const ErrorView();
    }
  }

  void endRefresh() {
    Future.delayed(const Duration(milliseconds: 20)).then((value) {
      print("Refresh complete");
      if (_refreshController.isRefresh) _refreshController.refreshCompleted();
      if (_refreshController.isLoading) _refreshController.loadComplete();
    });
  }
}
