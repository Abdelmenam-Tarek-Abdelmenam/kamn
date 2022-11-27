import 'package:flutter/material.dart';
import 'package:kamn/bloc/auth_bloc/auth_status_bloc.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';

import '../../../shared/widget/avatar.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(AuthBloc.user);
    return Column(
      children: [
        Avatar(
          AuthBloc.user.photoUrl ?? "",
          width: 100,
        ),
        Dividers.h5,
        Text(
          AuthBloc.user.name ?? "App User",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontWeight: FontWeight.w100,
                height: 1,
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 14,
              ),
        )
      ],
    );
  }
}
