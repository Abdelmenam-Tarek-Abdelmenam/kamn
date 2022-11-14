import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamn/presentation/resources/string_manager.dart';
import 'package:kamn/presentation/shared/toast_helper.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../resources/styles_manager.dart';

class ContactsIcons extends StatelessWidget {
  ContactsIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        contactIcon(context,
            icon: Icons.email_outlined,
            label: StringManger.email,
            backGround: Colors.indigoAccent,
            foreGround: Colors.indigo,
            url: emailLink),
        Dividers.w10,
        contactIcon(context,
            icon: Icons.phone_outlined,
            label: StringManger.call,
            backGround: Colors.orangeAccent,
            foreGround: Colors.deepOrange,
            url: "tel://+201201838240"),
        Dividers.w10,
        contactIcon(context,
            icon: FontAwesomeIcons.whatsapp,
            label: StringManger.chat,
            backGround: Colors.green,
            foreGround: Colors.green,
            url: whatsappUrl),
      ],
    );
  }

  Widget contactIcon(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color backGround,
    required Color foreGround,
    required String url,
  }) =>
      Expanded(
        child: ClipRRect(
          borderRadius: StyleManager.border,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: StyleManager.border,
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimary
                      .withOpacity(0.75)),
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      } else {
                        showToast("Can't launch this contact method");
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: HSLColor.fromColor(backGround)
                          .withLightness(0.85)
                          .toColor(),
                      radius: 25,
                      child: Icon(
                        icon,
                        color: foreGround.withAlpha(1000),
                      ),
                    ),
                  ),
                  Dividers.h5,
                  Text(
                    label,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: foreGround.withOpacity(0.8),
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  String get whatsappUrl {
    if (Platform.isAndroid) {
      return "whatsapp://send?phone=+201201838240&text${Uri.parse("Hello Kamn i want to chat with you about Customer Service")}";
    } else {
      return "https://wa.me/+201201838240/?text=${Uri.parse("")}"; // new line
    }
  }

  final String emailLink =
      "mailto:moneam.elbahy@gmail.com?subject=${Uri.encodeComponent("Customer Service")}&body=${Uri.encodeComponent("Hello Kamn i want to Email with you")}";
}
