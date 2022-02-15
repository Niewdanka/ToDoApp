import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/models/app_config.dart';
import 'package:to_do_app/widgets/vertical_line.dart';

class DayAndCalendar extends StatelessWidget {
  const DayAndCalendar({
    Key? key,
    required this.today,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  final DateTime today;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, top: 10),
              child: const Text(
                'Today',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, top: 5),
              child: Text(
                DateFormat('dd MMMM yyyy').format(today),
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),
              ),
            ),
            VerticalLine(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          ],
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.only(top: 10, right: 30),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.solidCalendarAlt,
              color: kPrimaryColor,
              size: 45,
            ),
          ),
        ),
      ],
    );
  }
}
