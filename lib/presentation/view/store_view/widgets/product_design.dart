import 'package:flutter/material.dart';
import 'package:kamn/presentation/resources/asstes_manager.dart';
import 'package:kamn/presentation/shared/widget/error_image.dart';

import '../../../../data/models/product.dart';
import '../../../resources/styles_manager.dart';

class ProductDesign extends StatelessWidget {
  final Product item;
  const ProductDesign(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.65),
        borderRadius: StyleManager.border,
      ),
      child: InkWell(
        onTap: () {},
        child: LayoutBuilder(
          builder: (context, constraints) => Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: item.id,
                    child: ClipRRect(
                      borderRadius: StyleManager.border, // Image border
                      child: item.img == ""
                          ? Image.asset(
                              AssetsManager.noProductImage,
                              height: constraints.maxHeight * .58,
                              width: double.infinity,
                              fit: BoxFit.fill,
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
                        Text(
                          item.name,
                          maxLines: 1,
                          strutStyle: const StrutStyle(
                            forceStrutHeight: true,
                            height: 1.5,
                          ),
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          "${item.price} EGP",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              item.provider,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ))
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                right: 10,
                top: constraints.maxHeight * .58 - 10,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Icon(Icons.add_shopping_cart_sharp),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
