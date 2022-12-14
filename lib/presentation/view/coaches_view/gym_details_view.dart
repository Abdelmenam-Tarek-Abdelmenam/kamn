import 'package:flutter/material.dart';
import 'package:kamn/presentation/resources/string_manager.dart';
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
      tabs: [Text(StringManger.coaches), Text(StringManger.coaches)],
      child: Expanded(
        child: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: PaddingManager.p15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PriceList(gym.subscriptions),
                    Dividers.h10,
                    FacilitiesList(gym.amenities),
                    Dividers.h10,
                    Text(
                      StringManger.photos,
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
                      StringManger.reviews,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontSize: 18),
                    ),
                    Dividers.h5,
                    ReviewList(gym.reviews),
                    const SizedBox(
                      height: 100,
                    ),
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
