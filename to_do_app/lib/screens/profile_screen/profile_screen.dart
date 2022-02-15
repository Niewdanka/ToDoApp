import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/screens/profile_screen/widgets/options_widget.dart';
import 'package:to_do_app/screens/profile_screen/widgets/profile_picture_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const routeName = '/user-profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          'Profil',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const ProfilePictureWidget(),
          const SizedBox(
            height: 20,
          ),
          const OptionsWidget(
            icon: Icons.settings,
            name: 'Ustawienia',
            onTap: null,
          ),
          OptionsWidget(
            icon: Icons.logout,
            name: 'Wyloguj',
            onTap: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
    );
  }
}
