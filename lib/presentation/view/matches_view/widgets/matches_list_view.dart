import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/bloc/matches_bloc/matches_bloc.dart';

import 'active_matches.dart';
import 'grounds.dart';

class MatchesListView extends StatelessWidget {
  const MatchesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchesBloc, MatchesState>(
      // buildWhen: (prev, next) => prev.type != next.type,
      builder: (context, state) {
        if (state.type == MatchesViewType.grounds) {
          return GroundsWidget(state.grounds);
        } else {
          return ActiveMatchesWidget(state.matches);
        }
      },
    );
  }
}
