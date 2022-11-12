import 'package:flutter/material.dart';
import 'package:kamn/presentation/resources/styles_manager.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';

import '../../resources/routes_manger.dart';
import '../../resources/string_manager.dart';
import '../../shared/custom_scafffold/animated_splash.dart';
import '../../shared/on_will_pop.dart';
import '../../shared/widget/form_field.dart';
import 'widgets/login_icons.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SplashView(
          menuIcon: IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              Navigator.pushNamed(context, Routes.home);
            },
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: PaddingManager.p15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person_pin,
                      size: 120,
                    ),
                    Dividers.h10,
                    emailBox(context),
                    Dividers.h20,
                    const LoginIcons(),
                    Dividers.h10,
                    Dividers.horizontalLine,
                    Dividers.h10,
                    TextButton(
                        onPressed: signUpCallBack,
                        child: Text(StringManger.signUp))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget emailBox(BuildContext context) => Column(
        children: [
          DefaultFormField(
            controller: emailController,
            title: StringManger.emailAddress,
          ),
          Dividers.h15,
          DefaultFormField(
            controller: passController,
            title: StringManger.password,
          ),
          Dividers.h10,
          SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                  onPressed: loginCallBack, child: const Text("Login")))
        ],
      );

  void loginCallBack() {
    print(emailController.text);
    print(passController.text);
  }

  void signUpCallBack() {}
}
