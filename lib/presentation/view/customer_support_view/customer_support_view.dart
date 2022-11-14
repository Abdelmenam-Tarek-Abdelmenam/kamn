import 'package:flutter/material.dart';
import 'package:kamn/presentation/shared/custom_scafffold/top_widget.dart';

import '../../resources/string_manager.dart';
import '../../resources/styles_manager.dart';
import '../../shared/custom_scafffold/sliding_scaffold.dart';
import 'widgets/contact_icons.dart';
import 'widgets/quic_contact.dart';

class CustomerSupportView extends StatelessWidget {
  const CustomerSupportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SlidingScaffold(
          title: StringManger.customerSupport,
          child: Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              // physics: const BouncingScrollPhysics(),
              child: ListView(
                children: [
                  TopWidget(bottom: 20, child: QuickContact()),
                  Padding(
                    padding: PaddingManager.p15,
                    child: ContactsIcons(),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
