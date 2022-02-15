import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class PickDate extends StatelessWidget {
  const PickDate({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.pickedDate,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final DateTime pickedDate;

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
            padding: const EdgeInsets.only(right: 10),
            child: const Icon(FontAwesomeIcons.calendarAlt),
          ),
          Text(
            DateFormat('dd MMM yyyy').format(pickedDate),
          ),
        ],
      ),
    );
  }
}
