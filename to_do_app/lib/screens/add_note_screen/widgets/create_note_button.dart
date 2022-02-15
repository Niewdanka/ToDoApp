import 'package:flutter/material.dart';
import 'package:to_do_app/models/app_config.dart';

class CreateNoteButton extends StatelessWidget {
  const CreateNoteButton({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 45),
      alignment: Alignment.center,
      height: screenHeight * 0.08,
      width: screenWidth * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kPrimaryColor,
      ),
      child: const Text(
        'Create Note',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
