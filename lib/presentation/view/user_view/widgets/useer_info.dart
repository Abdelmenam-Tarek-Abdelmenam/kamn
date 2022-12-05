import 'package:flutter/material.dart';
import 'package:kamn/bloc/auth_bloc/auth_status_bloc.dart';

import '../../../shared/widget/avatar.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Avatar(
              AuthBloc.user.photoUrl ?? "",
              width: 100,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: FilledButton.tonalIcon(
                icon: const Icon(Icons.sports_score_outlined),
                onPressed: () {},
                label: Text(AuthBloc.user.score.toString())),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Text(
            AuthBloc.user.name ?? "App User",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontWeight: FontWeight.w100,
                  height: 1,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 14,
                ),
          ),
        )
      ],
    );
  }
}
