import 'package:flutter/material.dart';
import 'package:to_do_app/models/app_config.dart';
import 'package:to_do_app/providers/notes.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.i,
    required this.notes,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final int i;
  final Notes notes;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          height: screenHeight * 0.101,
          width: notes.notes[i].width.toDouble(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kPrimaryColor,
          ),
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOutCubic,
        ),
        Container(
          height: screenHeight * 0.101,
          width: screenWidth * 0.78,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // border: Border.all(
            //   width: 0.5,
            //   color: Colors.grey[300]!,
            // ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15, right: 20),
                child: Icon(
                  IconData(notes.notes[i].icon, fontFamily: 'MaterialIcons'),
                  color: notes.notes[i].isCompleted == 1
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notes.notes[i].name,
                      style: TextStyle(
                        color: notes.notes[i].isCompleted == 1
                            ? Colors.white
                            : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      notes.notes[i].description,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Text(
                  notes.notes[i].time,
                  style: TextStyle(
                    color: notes.notes[i].isCompleted == 1
                        ? Colors.white
                        : Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 15),
                height: screenHeight * 0.07,
                width: screenWidth * 0.015,
                decoration: BoxDecoration(
                  color: Color(
                    notes.notes[i].categoryColor,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
