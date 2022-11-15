import 'package:flutter/material.dart';

import '../../resources/string_manager.dart';
import '../../resources/styles_manager.dart';
import '../../shared/custom_scafffold/sliding_scaffold.dart';
import '../../shared/custom_scafffold/top_widget.dart';
import 'widgets/active_tournaments.dart';
import 'widgets/tournaments_list.dart';

class TournamentsView extends StatelessWidget {
  const TournamentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
        title: StringManger.tournaments,
        child: Expanded(
          child: SingleChildScrollView(
            // physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                TopWidget(bottom: 20, child: ActiveTournamentsList()),
                Padding(
                  padding: PaddingManager.p15,
                  child: TournamentsList(),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ));
  }
}
