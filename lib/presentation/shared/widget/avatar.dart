import 'package:flutter/material.dart';

import '../../resources/asstes_manager.dart';

class Avatar extends StatelessWidget {
  const Avatar(this.url, {this.width, Key? key}) : super(key: key);
  final String url;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.8),
      radius: width == null ? null : (width! / 2) + 4,
      child: ClipOval(
        child: Image.network(
          url,
          fit: BoxFit.cover,
          width: width,
          height: width,
          // placeholder: AssetsManager.avatar,
          errorBuilder: (
            _,
            __,
            ___,
          ) {
            return Image.asset(
              AssetsManager.avatar,
              width: width,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
