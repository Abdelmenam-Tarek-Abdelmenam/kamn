import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/presentation/resources/string_manager.dart';
import 'package:kamn/presentation/resources/styles_manager.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';
import 'package:kamn/presentation/shared/widget/form_field.dart';
import 'package:kamn/presentation/shared/widget/loading_text.dart';
import '../../../bloc/auth_bloc/auth_status_bloc.dart';

import '../../shared/custom_scafffold/gradient_scaffold.dart';
import 'widgets/user_item_choice.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  final TextEditingController nameController =
      TextEditingController(text: AuthBloc.user.name);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: GradientScaffold(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            // height: 420,
            decoration: BoxDecoration(
                color:
                    Theme.of(context).colorScheme.onPrimary.withOpacity(0.65),
                // boxShadow: StyleManager.smallShadow,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(50))),
            child: Padding(
              padding: PaddingManager.p15.copyWith(bottom: 0),
              child: signUpWidgets(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget signUpWidgets(BuildContext context) => Column(
        children: [
          DefaultFormField(controller: nameController, title: "Name"),
          Dividers.h10,
          const UserChoice(Choice.category),
          Dividers.h10,
          const UserChoice(Choice.game),
          BlocBuilder<AuthBloc, AuthStates>(
            builder: (context, state) {
              return AnimatedCrossFade(
                  firstChild: ElevatedButton(
                      onPressed: () {
                        context
                            .read<AuthBloc>()
                            .add(RegisterUserDataEvent(nameController.text));
                      },
                      child: Text(StringManger.register)),
                  secondChild: const LoadingText(),
                  crossFadeState: state.status == AuthStatus.registerUser
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 50));
            },
          )
        ],
      );
}
