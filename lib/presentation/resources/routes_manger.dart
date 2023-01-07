import 'package:flutter/material.dart';
import 'package:kamn/data/models/benfits.dart';
import 'package:kamn/data/models/coach.dart';
import 'package:kamn/data/models/gym.dart';
import 'package:kamn/data/models/matches.dart';
import 'package:kamn/data/models/product.dart';
import 'package:kamn/presentation/view/benefits_view/benefits_view.dart';
import 'package:kamn/presentation/view/benefits_view/benefit_details_view.dart';
import 'package:kamn/presentation/view/coaches_view/coaach_details_view.dart';
import 'package:kamn/presentation/view/coaches_view/coach_achievment_view.dart';
import 'package:kamn/presentation/view/coaches_view/gym_details_view.dart';
import 'package:kamn/presentation/view/landing_view/landing_view.dart';
import 'package:kamn/presentation/view/login_view/login_view.dart';
import 'package:kamn/presentation/view/play_view/ground_details_view.dart';
import 'package:kamn/presentation/view/user_view/user_view.dart';

import '../view/coaches_view/coaches_view.dart';
import '../view/customer_support_view/customer_support_view.dart';
import '../view/leader_board_view/leader_board_view.dart';
import '../view/login_view/signup_view.dart';
import '../view/play_view/matches_view.dart';
import '../view/store_view/product_view.dart';
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
  static const String product = "/ProductView";
  static const String groundDetails = "/GroundDetailsView";
  static const String gymDetails = "/GymDetailsView";
  static const String coachDetails = "/coachDetails";
  static const String coachAchievements = "/coachAchievements";
  static const String benfitsDetails = "/benfitsDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => SignupView());
      case Routes.landing:
        return MaterialPageRoute(
            builder: (_) => const LandingView(HomePageStates.splash));
      case Routes.home:
        return MaterialPageRoute(
            builder: (_) => const LandingView(HomePageStates.landing));
      case Routes.match:
        return MaterialPageRoute(builder: (_) => MatchesView());
      case Routes.coaches:
        return MaterialPageRoute(builder: (_) => const CoachesView());
      case Routes.leaderBoard:
        return MaterialPageRoute(builder: (_) => LeaderBoardView());
      case Routes.benefits:
        return MaterialPageRoute(builder: (_) => BenefitsView());
      case Routes.store:
        return MaterialPageRoute(builder: (_) => StoreView());
      case Routes.customerSupport:
        return MaterialPageRoute(builder: (_) => const CustomerSupportView());
      case Routes.tournaments:
        return MaterialPageRoute(builder: (_) => TournamentsView());
      case Routes.user:
        return MaterialPageRoute(builder: (_) => const UserView());
      case Routes.product:
        return MaterialPageRoute(
            builder: (_) => ProductView(settings.arguments as Product));
      case Routes.groundDetails:
        return MaterialPageRoute(
            builder: (_) => GroundDetailsView(settings.arguments as Ground));
      case Routes.gymDetails:
        return MaterialPageRoute(
            builder: (_) => GymDetailsView(settings.arguments as Gym));
      case Routes.coachDetails:
        return MaterialPageRoute(
            builder: (_) => CoachDetailsView(settings.arguments as Coach));
      case Routes.coachAchievements:
        return MaterialPageRoute(
            builder: (_) => CoachAchievementsView(settings.arguments as Coach));
      case Routes.benfitsDetails:
        return MaterialPageRoute(
            builder: (_) => BenfitsDetailsView(settings.arguments as Benefit));

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
