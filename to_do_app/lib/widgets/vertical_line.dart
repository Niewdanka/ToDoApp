import 'package:flutter/material.dart';
import 'package:to_do_app/models/app_config.dart';

class VerticalLine extends StatelessWidget {
  const VerticalLine({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 15),
      height: screenHeight * 0.007,
      width: screenWidth * 0.3,
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
