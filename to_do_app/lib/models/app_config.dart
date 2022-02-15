import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF674EA7);

class SizeConfig {
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData!.size.width;
    screenHeight = mediaQueryData!.size.height;
  }
}
