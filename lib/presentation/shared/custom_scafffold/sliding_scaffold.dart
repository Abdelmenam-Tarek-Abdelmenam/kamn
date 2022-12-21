import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kamn/presentation/resources/string_manager.dart';
import 'package:kamn/presentation/resources/theme/theme_manager.dart';
import 'package:kamn/presentation/shared/custom_scafffold/widgets/gradient_container.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../resources/styles_manager.dart';
import 'widgets/bottom_panel.dart';

const double panelHeight = 25;

class SlidingScaffold extends StatelessWidget {
  const SlidingScaffold(
      {required this.child,
      required this.title,
      this.bottomNavigationBar,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.action,
      this.tabs,
      Key? key})
      : super(key: key);
  final Widget child;
  final Widget? floatingActionButton;
  final Widget? action;
  final List<Widget>? bottomNavigationBar;
  final List<Widget>? tabs;
  final String title;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      DefaultTabController(
        length: tabs?.length ?? 0,
        child: Scaffold(
          floatingActionButtonLocation: floatingActionButtonLocation ??
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: floatingActionButton,
          bottomNavigationBar:
              bottomNavigationBar == null ? null : bottomBar(context),
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: action == null ? null : [action!],
            title: Text(title),
            bottom: tabs == null
                ? null
                : TabBar(
                    labelPadding: PaddingManager.p10,
                    indicatorColor: Theme.of(context).colorScheme.onPrimary,
                    tabs: tabs!),
          ),
          body: bottomNavigationBar == null
              ? SlidingUpPanel(
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
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.95),
                    ),
                    child: BottomPanel(),
                  ),
                  body: lastChild(context),
                )
              : lastChild(context),
        ),
      ),
    );
  }

  Widget bottomBar(BuildContext context) => BottomAppBar(
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.65),
        shape: const CircularNotchedRectangle(), //shape of notch
        notchMargin: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: bottomNavigationBar!,
          ),
        ),
      );

  Widget lastChild(BuildContext context) => Column(
        children: [whiteDivider(context), child],
      );

  Widget whiteDivider(BuildContext context) => Divider(
        thickness: 2,
        height: 1,
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
      );

  Widget collapsedBuilder(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 80),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: StyleManager.border.copyWith(
              bottomLeft: const Radius.circular(0),
              bottomRight: const Radius.circular(0)),
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.80),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_upward_sharp,
                color: ColorManager.mainBlue.withOpacity(0.8),
                size: 15,
              ),
              Text(
                StringManger.appName,
                style: GoogleFonts.acme(
                  letterSpacing: 2,
                  fontWeight: FontWeight.w600,
                  color: ColorManager.mainBlue.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
              Icon(
                Icons.arrow_upward_sharp,
                color: ColorManager.mainBlue.withOpacity(0.8),
                size: 15,
              ),
            ],
          ),
        ),
      );
}
