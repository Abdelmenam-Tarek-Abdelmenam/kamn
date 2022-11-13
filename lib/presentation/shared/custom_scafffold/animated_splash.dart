import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kamn/presentation/resources/asstes_manager.dart';
import 'package:kamn/presentation/shared/custom_scafffold/widgets/customer_support_icon.dart';
import 'widgets/gradient_container.dart';

class SplashView extends StatefulWidget {
  const SplashView(
      {required this.child,
      this.menuIcon,
      this.action,
      this.title,
      this.showDivider = true,
      Key? key})
      : super(key: key);
  final Widget child;
  final String? title;
  final Widget? menuIcon;
  final Widget? action;
  final bool showDivider;

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  AnimationState animationFinished = AnimationState.idle;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 10), () {
      setState(() {
        animationFinished = AnimationState.start;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      AnimatedContainer(
        duration: const Duration(seconds: 1),
        color: animationFinished == AnimationState.idle
            ? Colors.white
            : Colors.transparent,
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: const CustomerSupportIcon(),
          appBar: AppBar(
            leading: widget.menuIcon,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: widget.action == null
                ? null
                : [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: widget.action!,
                    )
                  ],
            title: widget.title == null ? null : Text(widget.title!),
          ),
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Visibility(
                  visible: widget.showDivider, child: whiteDivider(context)),
              splashImage(),
              Visibility(
                visible: animationFinished == AnimationState.end,
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget splashImage() => AnimatedAlign(
        onEnd: () {
          animationFinished = AnimationState.end;
          setState(() {});
        },
        duration: const Duration(seconds: 1),
        alignment: animationFinished == AnimationState.idle
            ? Alignment.center
            : Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Image.asset(
            AssetsManager.logo,
            width: MediaQuery.of(context).size.width / 2.5,
          ),
        ),
      );

  Widget whiteDivider(BuildContext context) => Divider(
        thickness: 2,
        height: 0,
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
      );
}

enum AnimationState {
  idle,
  start,
  end,
}
