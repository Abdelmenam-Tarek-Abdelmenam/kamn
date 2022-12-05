import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/bloc/auth_bloc/auth_status_bloc.dart';
import 'package:kamn/data/repositories/auth_repository.dart';
import 'package:kamn/presentation/resources/routes_manger.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';
import 'package:kamn/presentation/view/user_view/widgets/useer_info.dart';

import '../../resources/string_manager.dart';
import '../../shared/custom_scafffold/sliding_scaffold.dart';
import '../../shared/custom_scafffold/top_widget.dart';
import '../../shared/widget/loading_text.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
        title: StringManger.userPage,
        action: BlocBuilder<AuthBloc, AuthStates>(
          builder: (context, state) {
            return IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  AuthRepository.signOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(Routes.login, (route) => false);
                });
          },
        ),
        child: Expanded(
            child: Column(
          children: const [
            TopWidget(bottom: 5, child: UserInfo()),
            Dividers.h20,
            Dividers.h20,
            LoadingText(),
          ],
        )));
  }
}
