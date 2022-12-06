import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/data/data_sources/web_services/mongo_repository.dart';

import 'bloc/auth_bloc/auth_status_bloc.dart';
import 'bloc/benfits_bloc/benfits_bloc.dart';
import 'bloc/coaches_bloc/coaches_bloc.dart';
import 'bloc/leader_board_bloc/leader_board_bloc.dart';
import 'bloc/matches_bloc/matches_bloc.dart';
import 'bloc/my_bloc_observer.dart';
import 'bloc/quick_contact/quick_contact_bloc.dart';
import 'bloc/store_bloc/store_bloc.dart';
import 'bloc/tournament_bloc/tournament_bloc.dart';
import 'data/data_sources/fcm.dart';

import 'data/data_sources/pref_repository.dart';
import 'data/models/app_user.dart';
import 'presentation/resources/routes_manger.dart';
import 'presentation/resources/string_manager.dart';
import 'presentation/resources/theme/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceRepository.init();
  await Firebase.initializeApp();
  await MongoDatabase.instance.init();
  FireNotificationHelper((_) {});
  Bloc.observer = MyBlocObserver();

  User? user = FirebaseAuth.instance.currentUser;
  AppUser appUser = AppUser.fromFirebaseUser(user);

  runApp(MyApp(appUser));
}

class MyApp extends StatelessWidget {
  const MyApp(this.user, {super.key});
  final AppUser user;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc(user), lazy: false),
          BlocProvider(create: (context) => BenfitsBloc()),
          BlocProvider(create: (context) => MatchesBloc()),
          BlocProvider(create: (context) => CoachesBloc()),
          BlocProvider(create: (context) => StoreBloc()),
          BlocProvider(create: (context) => TournamentBloc()),
          BlocProvider(create: (context) => LeaderBoardBloc()),
          BlocProvider(create: (context) => QuickContactBloc()),
        ],
        child: MaterialApp(
          title: StringManger.appName,
          theme: lightThemeData,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: user.isEmpty ? Routes.login : Routes.landing,
          // ),
        ),
      );
}
