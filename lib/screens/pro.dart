import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: LottieBuilder.asset(
        'assets/progress.json',
        height: 350,
      ),
    ));
  }
}
