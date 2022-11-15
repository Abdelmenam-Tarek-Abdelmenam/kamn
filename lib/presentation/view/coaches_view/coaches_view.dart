import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../resources/string_manager.dart';
import '../../shared/custom_scafffold/sliding_scaffold.dart';

class CoachesView extends StatefulWidget {
  const CoachesView({Key? key}) : super(key: key);

  @override
  State<CoachesView> createState() => _CoachesViewState();
}

class _CoachesViewState extends State<CoachesView> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
        title: StringManger.coaches,
        floatingActionButton: FloatingActionButton(
            backgroundColor:
                Theme.of(context).colorScheme.onPrimary.withOpacity(0.65),
            elevation: 0,
            child: Icon(
              FontAwesomeIcons.map,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
            ),
            onPressed: () {}),
        bottomNavigationBar: bottomBar(context),
        child: Container());
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
                    FontAwesomeIcons.handshakeAngle,
                    FontAwesomeIcons.dumbbell
                  ][i],
                  size: 25,
                ),
              ),
              label: Text(
                [StringManger.coach, StringManger.gym][i],
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
