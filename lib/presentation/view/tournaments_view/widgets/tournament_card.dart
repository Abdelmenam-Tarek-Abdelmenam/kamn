import 'package:flutter/material.dart';
import 'package:kamn/presentation/shared/widget/error_image.dart';
import '../../../../data/models/tournament.dart';

import '../../../resources/styles_manager.dart';

class TournamentCard extends StatelessWidget {
  const TournamentCard(this.item, {Key? key}) : super(key: key);
  final Tournament item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: PaddingManager.p15.copyWith(top: 0),
      child: Card(
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),
        elevation: 0,
        child: Column(
          children: [
            Text(
              item.name,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 16),
            ),
            Expanded(
              child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(10)),
                  child: ErrorImage(
                    item.img,
                    fit: BoxFit.fitHeight,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
