import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../resources/string_manager.dart';
import '../../shared/custom_scafffold/sliding_scaffold.dart';

class BenefitsView extends StatefulWidget {
  const BenefitsView({Key? key}) : super(key: key);

  @override
  State<BenefitsView> createState() => _BenefitsViewState();
}

class _BenefitsViewState extends State<BenefitsView> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
      title: StringManger.benfits,
      bottomNavigationBar: bottomBar(context),
      child: Container(),
    );
  }

  List<Widget> bottomBar(BuildContext context) => List.generate(
      2,
      (i) => SizedBox(
            width: 120,
            child: TextButton.icon(
              style: TextButton.styleFrom(
                  foregroundColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.65),
                  backgroundColor: index == i
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                      : null,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
              icon: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Icon(
                  [
                    FontAwesomeIcons.userDoctor,
                    FontAwesomeIcons.personRunning
                  ][i],
                  size: 25,
                ),
              ),
              label: Text(
                ["Medical", "Sports"][i],
                style:
                    const TextStyle(fontWeight: FontWeight.w100, fontSize: 16),
              ),
              onPressed: () {
                setState(() {
                  index = i;
                });
              },
            ),
          )).toList();
}
