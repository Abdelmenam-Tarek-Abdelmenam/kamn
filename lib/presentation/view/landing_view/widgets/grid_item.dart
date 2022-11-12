import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../resources/styles_manager.dart';

class GridItemDesign extends StatelessWidget {
  final GridItem item;
  const GridItemDesign(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 2 - 20;
    return SizedBox(
      width: width > 200 ? 200 : width,
      child: Padding(
        padding: PaddingManager.p4,
        child: ClipRRect(
          borderRadius: StyleManager.border,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: StyleManager.border,
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimary
                      .withOpacity(0.75)),
              child: InkWell(
                onTap: () => Navigator.of(context).pushNamed(item.route),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(8)), // Image border
                        child: Center(
                          child: Lottie.asset(
                            item.image,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Text(
                          item.title,
                          strutStyle: const StrutStyle(
                            forceStrutHeight: true,
                            height: 1.5,
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GridItem {
  String route;
  String title;
  String image;

  GridItem({required this.route, required this.title, required this.image});
}
