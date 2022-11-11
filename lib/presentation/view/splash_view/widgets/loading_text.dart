import 'package:flutter/material.dart';

class LoadingText extends StatelessWidget {
  const LoadingText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "loading ...",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
