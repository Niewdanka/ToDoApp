import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_app/models/app_config.dart';
import 'package:to_do_app/screens/home_screen/widgets/add_note_button.dart';
import 'package:to_do_app/screens/notes_screen/notes_screen.dart';
import 'package:to_do_app/screens/profile_screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedPageIndex = 0;

  final List<Widget> _pages = const [
    NotesScreen(),
    ProfileScreen(),
  ];

  Widget _buildBottomNavBarItem(
    IconData icon,
    double size,
    int index,
    String routeName,
  ) {
    return IconButton(
      icon: Icon(
        icon,
        size: size,
        color: _selectedPageIndex == index ? kPrimaryColor : Colors.black87,
      ),
      onPressed: _selectedPageIndex == index
          ? null
          : () {
              setState(() {
                _selectedPageIndex = index;
              });
            },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      floatingActionButton: const AddNoteButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Column(
          children: [
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[400],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomNavBarItem(
                    FontAwesomeIcons.home, 25, 0, 'routeName'),
                const SizedBox(),
                _buildBottomNavBarItem(
                    FontAwesomeIcons.bars, 25, 1, 'routeName'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
