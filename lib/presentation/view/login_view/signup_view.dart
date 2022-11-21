import 'package:flutter/material.dart';
import 'package:kamn/presentation/resources/styles_manager.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';
import 'package:kamn/presentation/shared/widget/form_field.dart';

import '../../shared/custom_scafffold/gradient_scaffold.dart';
import 'widgets/user_item_choice.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

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
              padding: PaddingManager.p15.copyWith(bottom: 30),
              child: signUpWidgets(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget signUpWidgets(BuildContext context) => Column(
        children: [
          DefaultFormField(controller: TextEditingController(), title: "Name"),
          Dividers.h10,
          const UserChoice(Choice.category),
          Dividers.h10,
          const UserChoice(Choice.game),
        ],
      );
}
