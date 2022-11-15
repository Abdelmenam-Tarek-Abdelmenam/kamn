import 'package:flutter/material.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage(this.url,
      {this.width, this.height, this.fit = BoxFit.cover, Key? key})
      : super(key: key);
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      height: height,
      width: width,
      fit: fit,
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