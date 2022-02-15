import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/app_config.dart';
import 'package:to_do_app/providers/notes.dart';
import 'package:to_do_app/screens/add_note_screen/add_note_screen.dart';
import 'package:to_do_app/screens/auth_screen/auth_screen.dart';
import 'package:to_do_app/screens/home_screen/home_screen.dart';
import 'package:to_do_app/screens/notes_screen/notes_screen.dart';
import 'package:to_do_app/screens/profile_screen/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Notes(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme.copyWith(
          textTheme: GoogleFonts.robotoTextTheme(),
          colorScheme: theme.colorScheme.copyWith(primary: kPrimaryColor),
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomeScreen();
            }
            return const AuthScren();
          },
        ),
        routes: {
          NotesScreen.routeName: (ctx) => const NotesScreen(),
          AddNoteScreen.routeName: (ctx) => const AddNoteScreen(),
          ProfileScreen.routeName: (ctx) => const ProfileScreen(),
        },
      ),
    );
  }
}
