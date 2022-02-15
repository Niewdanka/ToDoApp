import 'package:flutter/material.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: CircleAvatar(
            child: Image.asset('assets/images/avatar-app-modified.png'),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Przemek Niewdana',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
