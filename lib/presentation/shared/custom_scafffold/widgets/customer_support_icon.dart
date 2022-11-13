import 'package:flutter/material.dart';
import 'package:kamn/presentation/resources/asstes_manager.dart';
import 'package:kamn/presentation/resources/routes_manger.dart';
import 'package:kamn/presentation/resources/string_manager.dart';
import 'package:lottie/lottie.dart';

class CustomerSupportIcon extends StatelessWidget {
  const CustomerSupportIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        tooltip: StringManger.customerSupport,
        backgroundColor:
            Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
        elevation: 0,
        child: Lottie.asset(LottieManager.customerSupport, width: 80),
        onPressed: () =>
            Navigator.of(context).pushNamed(Routes.customerSupport));
  }
}
