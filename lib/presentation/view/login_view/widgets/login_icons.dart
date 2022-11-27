import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/presentation/resources/asstes_manager.dart';
import 'package:kamn/presentation/resources/routes_manger.dart';
import 'package:kamn/presentation/resources/styles_manager.dart';

import 'package:kamn/presentation/shared/customs_icons.dart';

import '../../../../bloc/auth_bloc/auth_status_bloc.dart';

class LoginIcons extends StatelessWidget {
  const LoginIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BlocBuilder<AuthBloc, AuthStates>(
          builder: (context, state) {
            return IconButton(
              iconSize: 52,
              icon: const CustomIcon(
                IconsManager.facebook,
              ),
              onPressed: () => facebookIconCallback(context),
            );
          },
        ),
        BlocBuilder<AuthBloc, AuthStates>(
          builder: (context, state) {
            return Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                  color: Theme.of(context).colorScheme.onPrimary),
              child: state.status == AuthStatus.submittingGoogle
                  ? const Padding(
                      padding: PaddingManager.p15,
                      child: CircularProgressIndicator(),
                    )
                  : IconButton(
                      iconSize: 38,
                      icon: const CustomIcon(
                        IconsManager.google,
                        width: 35,
                      ),
                      onPressed: () => googleIconCallback(context),
                    ),
            );
          },
        ),
      ],
    );
  }

  void facebookIconCallback(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.home);
  }

  void googleIconCallback(BuildContext context) {
    context.read<AuthBloc>().add(LoginInUsingGoogleEvent());
  }
}
