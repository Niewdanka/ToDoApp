import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_app/models/app_config.dart';
import 'package:to_do_app/screens/add_note_screen/add_note_screen.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 0.5,
            color: Colors.grey,
          ),
        ),
        child: const Icon(
          FontAwesomeIcons.plus,
          size: 20,
          color: Colors.white,
        ),
      ),
      onTap: () => Navigator.pushNamed(
        context,
        AddNoteScreen.routeName,
      ),
    );
  }
}
