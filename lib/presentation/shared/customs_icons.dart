import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(this.iconName, {this.width, Key? key}) : super(key: key);
  final String iconName;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconName,
      width: width,
    );
  }
}
