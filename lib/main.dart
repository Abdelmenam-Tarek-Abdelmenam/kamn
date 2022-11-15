import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/data/models/app_user.dart';

import 'bloc/auth_bloc/auth_status_bloc.dart';
import 'bloc/benfits_bloc/benfits_bloc.dart';
import 'bloc/my_bloc_observer.dart';
import 'data/data_sources/fcm.dart';
import 'data/data_sources/pref_repository.dart';
import 'presentation/resources/routes_manger.dart';
import 'presentation/resources/string_manager.dart';
import 'presentation/resources/theme/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceRepository.init();
  await Firebase.initializeApp();
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
          BlocProvider(
            create: (context) => AuthBloc(user),
          ),
          BlocProvider(
            create: (context) => BenfitsBloc(),
          ),
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
