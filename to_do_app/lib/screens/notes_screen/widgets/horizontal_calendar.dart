import 'package:flutter/material.dart';
import 'package:to_do_app/models/app_config.dart';

class HorizontalCalendar extends StatelessWidget {
  const HorizontalCalendar({
    Key? key,
    required this.screenWidth,
    required this.currentDateIndex,
    required this.month,
    required this.screenHeight,
    required this.today,
    required this.day,
    required this.i,
  }) : super(key: key);

  final double screenWidth;
  final int currentDateIndex;
  final String month;
  final double screenHeight;
  final DateTime today;
  final String day;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: screenWidth * 0.142,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: currentDateIndex == i
            ? kPrimaryColor
            : Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            month,
            style: TextStyle(
              fontSize: 13,
              color: currentDateIndex == i ? Colors.white : Colors.black87,
            ),
          ),
          SizedBox(
            height: screenHeight * 0.005,
          ),
          Text(
            today.add(Duration(days: i)).day.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: currentDateIndex == i ? Colors.white : Colors.black87,
            ),
          ),
          SizedBox(
            height: screenHeight * 0.005,
          ),
          Text(
            day,
            style: TextStyle(
              fontSize: 13,
              color: currentDateIndex == i ? Colors.white : Colors.black87,
            ),
          ),
          SizedBox(
            height: screenHeight * 0.006,
          ),
          currentDateIndex == i
              ? Container(
                  height: 7,
                  //width: 10,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
