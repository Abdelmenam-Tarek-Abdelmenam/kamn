import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/bloc/quick_contact/quick_contact_bloc.dart';
import 'package:kamn/bloc/status.dart';
import 'package:kamn/data/models/coustmer_message.dart';
import 'package:kamn/presentation/resources/asstes_manager.dart';
import 'package:kamn/presentation/resources/string_manager.dart';
import 'package:kamn/presentation/shared/widget/form_field.dart';
import 'package:kamn/presentation/shared/widget/loading_text.dart';
import 'package:lottie/lottie.dart';

class QuickContact extends StatefulWidget {
  const QuickContact({Key? key}) : super(key: key);

  @override
  State<QuickContact> createState() => _QuickContactState();
}

class _QuickContactState extends State<QuickContact> {
  final TextEditingController messageBody = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController userPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            child: BlocBuilder<QuickContactBloc, BlocStatus>(
              builder: (context, state) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: finalWidget(context, state),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget finalWidget(BuildContext context, BlocStatus status) {
    switch (status) {
      case BlocStatus.idle:
        return SizedBox(
          width: 150,
          height: 40,
          child: ElevatedButton.icon(
            onPressed: () => sendMessage(context),
            icon: const Icon(
              Icons.send,
              size: 20,
            ),
            label: Text(StringManger.submit),
          ),
        );
      case BlocStatus.gettingData:
        return const LoadingText();
      case BlocStatus.getData:
        return Text(
          "We will contact you soon",
          style:
              Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20),
        );
      case BlocStatus.error:
        return FittedBox(
          child: Text(
            "Sorry an error happened ,Please try later",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 20),
          ),
        );
    }
  }

  void sendMessage(BuildContext context) {
    context.read<QuickContactBloc>().add(SendMessageEvent(CustomerMessage(
        message: messageBody.text,
        phoneNumber: userPhone.text,
        name: nameController.text)));
  }
}
