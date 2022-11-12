import 'package:flutter/material.dart';
import 'package:kamn/presentation/shared/custom_scafffold/widgets/gradient_container.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../resources/styles_manager.dart';
import 'widgets/bottom_panel.dart';

const double panelHeight = 26;

class SlidingScaffold extends StatelessWidget {
  const SlidingScaffold({required this.child, required this.title, Key? key})
      : super(key: key);
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(title),
          ),
          body: SlidingUpPanel(
            color: Colors.transparent,
            boxShadow: const [],
            collapsed: collapsedBuilder(context),
            maxHeight: 375,
            minHeight: panelHeight,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            panel: Container(
              padding: PaddingManager.p15,
              margin: const EdgeInsets.only(top: panelHeight),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
                color:
                    Theme.of(context).colorScheme.onPrimary.withOpacity(0.95),
              ),
              child: BottomPanel(),
            ),
            body: child,
          ),
        ),
      ),
    );
  }

  Widget whiteDivider(BuildContext context) => Divider(
        thickness: 2,
        height: 0,
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
      );

  Widget collapsedBuilder(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 80),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: StyleManager.border.copyWith(
              bottomLeft: const Radius.circular(0),
              bottomRight: const Radius.circular(0)),
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.9),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, __) => Divider(
                    thickness: 1.5,
                    height: 2.5,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              separatorBuilder: (_, __) => const SizedBox(
                    height: 3,
                  ),
              itemCount: 3),
        ),
      );
}
