import 'package:flutter/material.dart';
import 'package:kamn/presentation/resources/asstes_manager.dart';
import 'package:kamn/presentation/resources/string_manager.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';
import 'package:kamn/presentation/shared/widget/error_image.dart';
import '../../../../data/models/product.dart';
import '../../../resources/routes_manger.dart';

import '../../../resources/styles_manager.dart';

class ProductDesign extends StatelessWidget {
  final Product item;
  const ProductDesign(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 2 - 30;
    return Container(
      margin: const EdgeInsets.all(5.0),
      width: width > 200 ? 200 : width,
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.65),
        borderRadius: StyleManager.border,
      ),
      child: InkWell(
        onTap: () =>
            Navigator.of(context).pushNamed(Routes.product, arguments: item),
        child: LayoutBuilder(
          builder: (context, constraints) => Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: item.id,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10)), // Image border
                      child: item.img == ""
                          ? Image.asset(
                              AssetsManager.noProductImage,
                              height: constraints.maxHeight * .58,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : ErrorImage(
                              item.img,
                              height: constraints.maxHeight * .58,
                              width: double.infinity,
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            item.name,
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
                        Text(
                          item.provider,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "${item.price} ${StringManger.priceUnit}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // Positioned(
              //   right: 5,
              //   top: constraints.maxHeight * .58 - 35,
              //   child: const CircleAvatar(
              //     radius: 20,
              //     // backgroundColor: Theme.of(context).primaryColor,
              //     child: Icon(
              //       Icons.add_shopping_cart_sharp,
              //       size: 22,
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
