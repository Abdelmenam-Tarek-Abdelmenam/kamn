import 'package:flutter/material.dart';
import 'package:kamn/data/models/tournament.dart';
import 'package:kamn/presentation/view/tournaments_view/widgets/tournament_card.dart';

class TournamentsList extends StatelessWidget {
  TournamentsList({Key? key}) : super(key: key);
  final List<Tournament> tournaments = [
    Tournament(img: testImage1, name: "RedBull Tournament"),
    Tournament(img: testImage2, name: "RedBull Tournament"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, i) => TournamentCard(tournaments[i]),
        itemCount: tournaments.length);
  }
}
