import 'package:flutter/material.dart';

class OnBoardingDot extends StatelessWidget {
  const OnBoardingDot({
    Key? key, required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(50.0))),
    );
  }
}