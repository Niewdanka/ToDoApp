import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PickTime extends StatelessWidget {
  const PickTime({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.pickedTime,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final TimeOfDay pickedTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.08,
      width: screenWidth * 0.37,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[400],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const Icon(FontAwesomeIcons.clock),
          ),
          Text(pickedTime.format(context)),
        ],
      ),
    );
  }
}
