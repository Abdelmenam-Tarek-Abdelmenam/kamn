import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/data/data_sources/web_services/mongo_repository.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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
  FireNotificationHelper(print);
  Bloc.observer = MyBlocObserver();

  String? userData = PreferenceRepository.getData(key: PreferenceKey.userData);
  CompleteUser? user =
      userData == null ? null : CompleteUser.fromJson(userData);

  await SentryFlutter.init(
    (options) {
      options.dsn = _sentryKey;
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(MyApp(user)),
  );
}

class MyApp extends StatelessWidget {
  const MyApp(this.user, {super.key});
  final CompleteUser? user;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc(user), lazy: false),
          BlocProvider(create: (context) => BenfitsBloc()),
          BlocProvider(create: (context) => PlayBloc()),
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
          initialRoute: user == null ? Routes.login : Routes.landing,
          // ),
        ),
      );
}

const _sentryKey =
    'https://e340116efbe34fb0b639b99805246bdf@o4504541550477312.ingest.sentry.io/4504541552967680';
