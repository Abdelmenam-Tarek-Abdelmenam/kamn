import 'package:flutter/material.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage(this.url, {this.width, this.height, Key? key})
      : super(key: key);
  final String url;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      url,
      height: height,
      width: width,
      fit: BoxFit.fill,
      errorBuilder: (
        _,
        __,
        ___,
      ) {
        return SizedBox(
          width: width,
          height: height,
          child: const Center(
            child: Icon(
              Icons.downloading,
              size: 30,
            ),
          ),
        );
      },
    );
  }
}
