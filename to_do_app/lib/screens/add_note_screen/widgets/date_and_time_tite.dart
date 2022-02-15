import 'package:flutter/material.dart';

class DateAndTimeTitle extends StatelessWidget {
  const DateAndTimeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, bottom: 15),
      child: const Text(
        'Choose Date & Time',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
