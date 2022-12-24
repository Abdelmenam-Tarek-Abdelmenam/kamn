import 'package:flutter/material.dart';
import 'package:kamn/data/models/coach.dart';
import 'package:kamn/presentation/resources/styles_manager.dart';
import 'package:kamn/presentation/shared/custom_scafffold/sliding_scaffold.dart';
import 'package:kamn/presentation/shared/widget/error_image.dart';
import 'package:url_launcher/url_launcher.dart';

class CoachAchievementsView extends StatelessWidget {
  const CoachAchievementsView(this.coach, {Key? key}) : super(key: key);
  final Coach coach;

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
      title: coach.name,
      action: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.call),
      ),
      child: Expanded(
        child: coach.achievements.isEmpty
            ? Center(
                child: Text(
                  "No Achievements",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 24),
                ),
              )
            : Padding(
                padding: PaddingManager.p15,
                child: ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                          horizontalTitleGap: 10,
                          tileColor: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(0.57),
                          style: ListTileStyle.drawer,

                          onTap: coach.achievements[index].url == null
                              ? null
                              : () {
                                  launchUrl(Uri.parse(
                                      coach.achievements[index].url!));
                                },
                          isThreeLine: true,
                          title: FittedBox(
                              child: Text(coach.achievements[index].name)),
                          // trailing: Text(coach.achievements[index].date),
                          subtitle: Text(
                              "${coach.achievements[index].provider}\n${coach.achievements[index].date}"),
                          leading: ClipRRect(
                              borderRadius: StyleManager.border,
                              child: ErrorImage(coach.achievements[index].img)),
                        ),
                    // separatorBuilder: (separatorBuilder),
                    itemCount: coach.achievements.length),
              ),
      ),
    );
  }
}
