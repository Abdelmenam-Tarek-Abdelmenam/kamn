import 'package:flutter/material.dart';
import 'package:kamn/presentation/resources/asstes_manager.dart';
import 'package:kamn/presentation/resources/string_manager.dart';
import 'package:kamn/presentation/shared/widget/form_field.dart';
import 'package:lottie/lottie.dart';

class QuickContact extends StatelessWidget {
  QuickContact({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController messageBody = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Lottie.asset(LottieManager.quickContact, height: 180),
                    // Dividers.h15,
                    DefaultFormField(
                      fillHint: AutofillHints.name,
                      controller: nameController,
                      title: StringManger.name,
                      prefix: Icons.person_outline_outlined,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DefaultFormField(
                      keyboardType: TextInputType.phone,
                      fillHint: AutofillHints.telephoneNumber,
                      controller: userPhone,
                      title: StringManger.phone,
                      prefix: Icons.phone_outlined,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DefaultFormField(
                      keyboardType: TextInputType.multiline,
                      controller: messageBody,
                      maxLines: 5,
                      title: StringManger.message,
                      prefix: Icons.message,
                    ),
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  width: 150,
                  height: 40,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      size: 20,
                    ),
                    label: Text(StringManger.submit),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
