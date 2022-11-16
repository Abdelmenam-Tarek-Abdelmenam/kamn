import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/bloc/benfits_bloc/benfits_bloc.dart';

import '../../resources/string_manager.dart';
import '../../shared/custom_scafffold/sliding_scaffold.dart';
import 'widgets/benefits_widget.dart';

class BenefitsView extends StatelessWidget {
  const BenefitsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
      title: StringManger.benfits,
      bottomNavigationBar:
          bottomBar(context, context.watch<BenfitsBloc>().state.type),
      child: Expanded(
        child: ListView(
          children: [
            BlocBuilder<BenfitsBloc, BenfitsState>(
              // buildWhen: (prev, next) => prev.type != next.type,
              builder: (context, state) {
                if (state.type == BenfitsViewType.sport) {
                  return BenfitsWidget(state.sportBenefits);
                } else {
                  return BenfitsWidget(state.medicalBenefits);
                }
              },
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> bottomBar(BuildContext context, BenfitsViewType type) =>
      BenfitsViewType.values
          .map((i) => SizedBox(
                width: 120,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.65),
                      backgroundColor: i == type
                          ? Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.2)
                          : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Icon(
                      i.toIcon(),
                      size: 25,
                    ),
                  ),
                  label: Text(
                    i.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w100, fontSize: 16),
                  ),
                  onPressed: () {
                    context.read<BenfitsBloc>().add(ChangeViewTypeEvent(i));
                  },
                ),
              ))
          .toList();
}
