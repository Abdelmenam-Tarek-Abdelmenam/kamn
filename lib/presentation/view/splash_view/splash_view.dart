import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kamn/presentation/resources/asstes_manager.dart';
import 'package:kamn/presentation/view/splash_view/widgets/loading_text.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool changed = false;
  Alignment imageAlign = Alignment.center;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 10), () {
      setState(() {
        imageAlign = Alignment.bottomCenter;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Visibility(
            visible: changed,
            child: const LoadingText(),
          ),
          splashImage()
        ],
      ),
    );
  }

  Widget splashImage() => AnimatedAlign(
        onEnd: () {
          changed = true;
          setState(() {});
        },
        duration: const Duration(seconds: 1),
        alignment: imageAlign,
        child: Image.asset(
          AssetsManager.splash,
          width: MediaQuery.of(context).size.width / 2,
        ),
      );
}
