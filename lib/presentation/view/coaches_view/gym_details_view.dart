import 'package:flutter/material.dart';
import 'package:kamn/presentation/shared/custom_scafffold/sliding_scaffold.dart';
import 'package:kamn/presentation/shared/details_widget.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';

import '../../../data/models/gym.dart';
import '../../resources/styles_manager.dart';
import '../../shared/widget/error_image.dart';

class GymDetailsView extends StatelessWidget {
  const GymDetailsView(this.gym, {Key? key}) : super(key: key);
  final Gym gym;

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
      title: gym.name,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
        child: const Icon(
          Icons.book_online,
        ),
        onPressed: () {},
      ),
      action: IconButton(
        icon: const Icon(Icons.call),
        onPressed: () {},
      ),
      tabs: const [Text("General"), Text("Coaches")],
      child: Expanded(
        child: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: PaddingManager.p15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    priceText(),
                    Dividers.h10,
                    FacilitiesList(gym.amenities),
                    Dividers.h10,
                    Text(
                      "Photos",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontSize: 18),
                    ),
                    Dividers.h5,
                    ImagesList(gym.images),
                    Dividers.h15,
                    AddressBox(gym.address, gym.lat, gym.lon),
                    Dividers.h10,
                    Text(
                      "Reviews",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontSize: 18),
                    ),
                    Dividers.h5,
                    ReviewList(gym.reviews),
                  ],
                ),
              ),
            ),
            Padding(
              padding: PaddingManager.p10,
              child: Wrap(
                children:
                    gym.coaches.map((e) => coachBuilder(context, e)).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget priceText() {
    bool active = false;
    return StatefulBuilder(builder: (context, setState) {
      return BackGround(
          padding: EdgeInsets.zero,
          child: Center(
            child: ExpansionPanelList(
              elevation: 0.0,
              animationDuration: const Duration(seconds: 1),
              expandedHeaderPadding: EdgeInsets.zero,
              expansionCallback: (int index, bool status) {
                active = !status;
                setState(() {});
              },
              children: [
                ExpansionPanel(
                    canTapOnHeader: true,
                    backgroundColor: Colors.transparent,
                    isExpanded: active,
                    headerBuilder: (context, _) => Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              " Subscriptions",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                    body: Column(
                      children: gym.subscriptions.keys
                          .map((key) => ListTile(
                                iconColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                contentPadding: EdgeInsets.zero,
                                tileColor: Colors.transparent,
                                leading: const Icon(Icons.attach_money),
                                title: Text(key,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(fontSize: 16)),
                                trailing: Text("${gym.subscriptions[key]!} ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(fontSize: 14)),
                              ))
                          .toList(),
                    )),
              ],
            ),
          ));
    });
  }

  Widget coachBuilder(BuildContext context, GymCoach coach) {
    // GymCoach coach = gym.coaches[index];
    return Container(
      margin: const EdgeInsets.all(5.0),
      width: MediaQuery.of(context).size.width / 2 - 20,
      height: 170,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.65),
        borderRadius: StyleManager.border,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10)), // Image border
                  child: ErrorImage(
                    coach.img,
                    height: constraints.maxHeight * .58,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          coach.name,
                          maxLines: 1,
                          strutStyle: const StrutStyle(
                            forceStrutHeight: true,
                            height: 1.5,
                          ),
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Dividers.h5,
                      FittedBox(
                        child: Text(
                          coach.description,
                          style: Theme.of(context).textTheme.bodyLarge,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
