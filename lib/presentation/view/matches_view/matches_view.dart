import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamn/presentation/resources/string_manager.dart';
import 'package:kamn/presentation/shared/custom_scafffold/sliding_scaffold.dart';

class MatchesView extends StatefulWidget {
  const MatchesView({Key? key}) : super(key: key);

  @override
  State<MatchesView> createState() => _MatchesViewState();
}

class _MatchesViewState extends State<MatchesView> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
        title: StringManger.match,
        floatingActionButton: FloatingActionButton(
            tooltip: "Create",
            backgroundColor:
                Theme.of(context).colorScheme.onPrimary.withOpacity(0.65),
            elevation: 0,
            child: Icon(
              Icons.create,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
            ),
            onPressed: () {}),
        bottomNavigationBar: bottomBar(context),
        child: Container());
  }

  List<Widget> bottomBar(BuildContext context) => List.generate(
      2,
      (i) => TextButton.icon(
            style: TextButton.styleFrom(
                foregroundColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.65),
                backgroundColor: index == i
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                    : null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                )),
            icon: Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Icon(
                [FontAwesomeIcons.futbol, FontAwesomeIcons.peopleGroup][i],
                size: 25,
              ),
            ),
            label: Text(
              ["Grounds", "Active"][i],
              style: const TextStyle(fontWeight: FontWeight.w100, fontSize: 16),
            ),
            onPressed: () {
              setState(() {
                index = i;
              });
            },
          )).toList();
}
