import 'package:flutter/material.dart';
import 'package:kamn/presentation/resources/routes_manger.dart';
import 'package:kamn/presentation/resources/string_manager.dart';
import 'package:kamn/presentation/shared/custom_scafffold/animated_splash.dart';
import 'package:kamn/presentation/shared/custom_scafffold/gradient_scaffold.dart';
import 'package:kamn/presentation/shared/on_will_pop.dart';

import 'widgets/home_grid.dart';

class LandingView extends StatelessWidget {
  const LandingView(this.state, {Key? key}) : super(key: key);
  final HomePageStates state;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showMyDialog(context),
      child: state == HomePageStates.splash
          ? SplashView(
              title: StringManger.appName,
              action: action(context),
              child: homePageView(context),
            )
          : GradientScaffold(
              action: action(context),
              child: homePageView(context),
            ),
    );
  }

  Widget action(BuildContext context) => IconButton(
      onPressed: () => Navigator.of(context).pushNamed(Routes.user),
      icon: const Icon(Icons.person_outline_outlined));

  Widget homePageView(BuildContext context) => HomeGrid();
}

enum HomePageStates { splash, landing }
