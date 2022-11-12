import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/data/models/app_user.dart';

import 'bloc/auth_bloc/auth_status_bloc.dart';
import 'bloc/my_bloc_observer.dart';
import 'bloc/style_bloc/style_bloc.dart';
import 'data/data_sources/pref_repository.dart';
import 'presentation/resources/routes_manger.dart';
import 'presentation/resources/string_manager.dart';
import 'presentation/resources/theme/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceRepository.init();
  await Firebase.initializeApp();
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
            create: (context) => StyleBloc(),
          ),
          BlocProvider(
            create: (context) => AuthBloc(user),
          ),
        ],
        child: BlocBuilder<StyleBloc, StyleBlocState>(
          builder: (context, state) {
            StringManger.setLanguage = state.languageMode.index;
            return
                // Directionality(
                // textDirection: state.languageMode.textDirection,
                // child:
                MaterialApp(
              // locale: state.languageMode.locale,
              // supportedLocales: LanguageMode.values.map((e) => e.locale),
              // localizationsDelegates: const [
              //   GlobalMaterialLocalizations.delegate,
              //   GlobalWidgetsLocalizations.delegate,
              //   GlobalCupertinoLocalizations.delegate,
              // ],
              title: StringManger.appName,
              theme: lightThemeData,
              darkTheme: darkThemeData,
              debugShowCheckedModeBanner: false,
              themeMode: state.themeMode,
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: user.isEmpty ? Routes.login : Routes.landing,
              // ),
            );
          },
        ),
      );
}
