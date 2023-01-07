import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamn/presentation/resources/string_manager.dart';
import 'package:kamn/presentation/shared/details_widget.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';
import 'package:kamn/presentation/shared/widget/error_image.dart';

import '../../../data/models/product.dart';
import '../../resources/styles_manager.dart';

import '../../resources/theme/theme_manager.dart';
import '../../shared/custom_scafffold/sliding_scaffold.dart';
import '../../shared/custom_scafffold/top_widget.dart';
import '../../shared/widget/drop_down_menue.dart';

class ProductView extends StatelessWidget {
  ProductView(this.product, {Key? key}) : super(key: key);
  final Product product;
  final ValueNotifier<int> quantity = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SlidingScaffold(
          showSliding: false,
          title: product.name,
          child: Expanded(
            child: Stack(alignment: Alignment.bottomRight, children: [
              ListView(
                children: [
                  TopWidget(
                      bottom: 25,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 70, left: 30),
                            child: ClipRRect(
                              borderRadius: StyleManager.border,
                              child: Column(
                                children: [
                                  Hero(
                                    tag: product.id,
                                    child: ErrorImage(
                                      product.img,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: FilledButton.tonalIcon(
                                icon: const Icon(Icons.attach_money),
                                onPressed: () {},
                                label: Text(product.price.toString())),
                          )
                        ],
                      )),
                  Padding(
                    padding: PaddingManager.p15,
                    child: productDetails(context),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
              Positioned(
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ValueListenableBuilder<int>(
                        valueListenable: quantity,
                        builder: (context, val, _) {
                          return Text(
                            "${StringManger.totalPrice} : ${val * product.price} ",
                            style: Theme.of(context).textTheme.labelLarge,
                          );
                        }),
                  )),
              Positioned(
                right: 0,
                child: Container(
                    width: 150,
                    height: 50,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.7),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30))),
                    child: Center(
                      child: Text(
                        StringManger.addToCart,
                        style: const TextStyle(color: Colors.white),
                      ),
                    )),
              ),
            ]),
          )),
    );
  }

  Widget productDetails(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringManger.quantity,
            style:
                Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 18),
          ),
          Dividers.h5,
          Row(
            children: [
              myIcon(context, FontAwesomeIcons.minus, () {
                if (quantity.value > 1) {
                  quantity.value--;
                  setState(() {});
                }
              }),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: PolygonSliderThumb(
                          thumbRadius: 16.0,
                          sliderValue: quantity.value.toDouble()),
                    ),
                    child: Slider(
                        min: 1,
                        max: 100,
                        divisions: 99,
                        activeColor: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.7),
                        inactiveColor: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.1),
                        value: quantity.value.toDouble(),
                        onChanged: (value) {
                          quantity.value = value.round();
                          setState(() {});
                        }),
                  ),
                ),
              ),
              myIcon(context, FontAwesomeIcons.plus, () {
                if (quantity.value < 100) {
                  quantity.value++;
                  setState(() {});
                }
              }),
            ],
          ),
          Visibility(
              visible: product.varieties.isNotEmpty,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Dividers.h10,
                  Text(
                    StringManger.chooseVariety,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 16),
                  ),
                  Dividers.h5,
                  DefaultDropDownMenu(
                      prefix: Icons.menu,
                      title: StringManger.varieties,
                      items: product.varieties
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (val) {}),
                  Dividers.h10,
                ],
              )),
          Text(
            StringManger.reviews,
            style:
                Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 18),
          ),
          Dividers.h5,
          ReviewList(product.reviews),
        ],
      );
    });
  }

  Widget myIcon(
      BuildContext context, IconData icon, void Function() onPressed) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.65),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: 15,
          )),
    );
  }
}

class PolygonSliderThumb extends SliderComponentShape {
  final double thumbRadius;
  final double sliderValue;

  const PolygonSliderThumb({
    required this.thumbRadius,
    required this.sliderValue,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;
    int sides = 4;
    double innerPolygonRadius = thumbRadius * 1;
    double outerPolygonRadius = thumbRadius * 1.2;
    double angle = (pi * 2) / sides;
    final outerPathColor = Paint()
      ..color = ColorManager.mainBlue
      ..style = PaintingStyle.fill;

    var outerPath = Path();

    Offset startPoint2 = Offset(
      outerPolygonRadius * cos(0.0),
      outerPolygonRadius * sin(0.0),
    );

    outerPath.moveTo(
      startPoint2.dx + center.dx,
      startPoint2.dy + center.dy,
    );

    for (int i = 1; i <= sides; i++) {
      double x = outerPolygonRadius * cos(angle * i) + center.dx;
      double y = outerPolygonRadius * sin(angle * i) + center.dy;
      outerPath.lineTo(x, y);
    }

    outerPath.close();
    canvas.drawPath(outerPath, outerPathColor);
    final innerPathColor = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.black
      ..style = PaintingStyle.fill;

    var innerPath = Path();

    Offset startPoint = Offset(
      innerPolygonRadius * cos(0.0),
      innerPolygonRadius * sin(0.0),
    );

    innerPath.moveTo(
      startPoint.dx + center.dx,
      startPoint.dy + center.dy,
    );

    for (int i = 1; i <= sides; i++) {
      double x = innerPolygonRadius * cos(angle * i) + center.dx;
      double y = innerPolygonRadius * sin(angle * i) + center.dy;
      innerPath.lineTo(x, y);
    }

    innerPath.close();
    canvas.drawPath(innerPath, innerPathColor);

    TextSpan span = TextSpan(
      style: TextStyle(
        fontSize: thumbRadius - 3,
        fontWeight: FontWeight.w500,
        color: ColorManager.mainBlue,
      ),
      text: sliderValue.round().toString(),
    );

    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    tp.layout();

    Offset textCenter = Offset(
      center.dx - (tp.width / 2),
      center.dy - (tp.height / 2),
    );

    tp.paint(canvas, textCenter);
  }
}
