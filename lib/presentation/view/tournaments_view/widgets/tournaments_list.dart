import 'package:flutter/material.dart';
import 'package:kamn/data/models/show_data.dart';
import 'package:kamn/data/models/tournament.dart';
import 'package:kamn/presentation/view/tournaments_view/widgets/tournament_card.dart';

class TournamentsList extends StatelessWidget {
  const TournamentsList(this.tournaments, {Key? key}) : super(key: key);
  final ShowData<Tournament> tournaments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, i) => TournamentCard(tournaments.data[i]),
        itemCount: tournaments.data.length);
  }
}
