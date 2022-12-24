import 'package:flutter/material.dart';
import 'package:kamn/data/models/benfits.dart';
import 'package:kamn/presentation/resources/styles_manager.dart';
import 'package:kamn/presentation/shared/custom_scafffold/sliding_scaffold.dart';
import 'package:kamn/presentation/shared/custom_scafffold/top_widget.dart';
import 'package:kamn/presentation/shared/details_widget.dart';
import 'package:kamn/presentation/shared/widget/error_image.dart';

import '../../shared/widget/dividers.dart';

class BenfitsDetailsView extends StatelessWidget {
  const BenfitsDetailsView(this.benefit, {Key? key}) : super(key: key);
  final Benefit benefit;

  @override
  Widget build(BuildContext context) {
    return SlidingScaffold(
        title: benefit.name,
        child: Expanded(
          child: ListView(
            children: [
              TopWidget(
                  bottom: 10,
                  child: Hero(
                      tag: benefit.id,
                      child: ClipRRect(
                        borderRadius: StyleManager.border,
                        child: ErrorImage(
                          benefit.img,
                          height: 180,
                          fit: BoxFit.fitHeight,
                        ),
                      ))),
              Padding(
                padding: PaddingManager.p10,
                child: Column(
                  children: [
                    BackGround(
                      child: Column(
                        children: [
                          Text(
                            "Overview",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontSize: 16),
                          ),
                          Dividers.h5,
                          Text(
                            benefit.description.trim(),
                            // textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w100,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                          )
                        ],
                      ),
                    ),
                    Dividers.h10,
                    PriceList(benefit.packages, label: "Packages"),
                    Dividers.h10,
                    AddressBox(benefit.address, benefit.lat, benefit.lon),
                    Dividers.h10,
                    ReviewList(benefit.reviews),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ));
  }
}
