import 'package:flutter/material.dart';
import 'package:kamn/presentation/resources/asstes_manager.dart';

import 'package:kamn/presentation/shared/customs_icons.dart';

class LoginIcons extends StatelessWidget {
  const LoginIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          iconSize: 52,
          icon: const CustomIcon(
            IconsManager.facebook,
          ),
          onPressed: facebookIconCallback,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
              color: Theme.of(context).colorScheme.onPrimary),
          child: IconButton(
            iconSize: 38,
            icon: const CustomIcon(
              IconsManager.google,
              width: 35,
            ),
            onPressed: googleIconCallback,
          ),
        ),
      ],
    );
  }

  void facebookIconCallback() {
    print("Login Using Facebook");
  }

  void googleIconCallback() {
    print("Login Using Google");
  }
}
