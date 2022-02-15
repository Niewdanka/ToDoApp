import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/screens/auth_screen/widgets/auth_form.dart';

class AuthScren extends StatefulWidget {
  const AuthScren({Key? key}) : super(key: key);

  static const routeName = '/auth-screen';

  @override
  State<AuthScren> createState() => _AuthScrenState();
}

class _AuthScrenState extends State<AuthScren> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;
  late String userId;

  void _submitAuth(
    String email,
    String password,
    bool isLogin,
  ) async {
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        // print(userId);

      } else {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      }
    } on PlatformException catch (error) {
      var message = 'Error';

      if (error.message != null) {
        message = error.message!;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthForm(
        submitAuth: _submitAuth,
        isLoading: _isLoading,
      ),
    );
  }
}
