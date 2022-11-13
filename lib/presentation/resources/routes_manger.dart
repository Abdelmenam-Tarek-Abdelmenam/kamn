import 'package:flutter/material.dart';
import 'package:kamn/presentation/view/benefits_view/benefits_view.dart';
import 'package:kamn/presentation/view/landing_view/landing_view.dart';
import 'package:kamn/presentation/view/login_view/login_view.dart';
import 'package:kamn/presentation/view/user_view/user_view.dart';

import '../view/coaches_view/coaches_view.dart';
import '../view/customer_support_view/customer_support_view.dart';
import '../view/leader_board_view/leader_board_view.dart';
import '../view/login_view/signup_view.dart';
import '../view/matches_view/matches_view.dart';
import '../view/store_view/store_view.dart';
import '../view/tournaments_view/tournaments_view.dart';

class Routes {
  static const String login = "/login";
  static const String landing = "/";
  static const String home = "/home";
  static const String user = "/user";
  static const String benefits = "/benfits";
  static const String coaches = "/coaches";
  static const String match = "/matches";
  static const String store = "/store";
  static const String tournaments = "/tournaments";
  static const String leaderBoard = "/leaderBoard";
  static const String customerSupport = "/customerSupport";
  static const String signup = "/signup";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const SignupView());
      case Routes.landing:
        return MaterialPageRoute(
            builder: (_) => const LandingView(HomePageStates.splash));
      case Routes.home:
        return MaterialPageRoute(
            builder: (_) => const LandingView(HomePageStates.landing));
      case Routes.match:
        return MaterialPageRoute(builder: (_) => const MatchesView());
      case Routes.coaches:
        return MaterialPageRoute(builder: (_) => const CoachesView());
      case Routes.leaderBoard:
        return MaterialPageRoute(builder: (_) => const LeaderBoardView());
      case Routes.benefits:
        return MaterialPageRoute(builder: (_) => const BenefitsView());
      case Routes.store:
        return MaterialPageRoute(builder: (_) => const StoreView());
      case Routes.customerSupport:
        return MaterialPageRoute(builder: (_) => const CustomerSupportView());
      case Routes.tournaments:
        return MaterialPageRoute(builder: (_) => const TournamentsView());
      case Routes.user:
        return MaterialPageRoute(builder: (_) => const UserView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("No Route Found"),
              ),
              body: const Center(child: Text("No Route Found")),
            ));
  }
}
