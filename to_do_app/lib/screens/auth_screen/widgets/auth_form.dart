import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_app/models/app_config.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key, required this.submitAuth, required this.isLoading})
      : super(key: key);

  final bool isLoading;

  final Function(
    String email,
    String password,
    bool isLogin,
  ) submitAuth;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool _secureText = true;
  bool _confirmSecureText = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;

  String _userEmail = '';
  String _userPassword = '';
  String _confirmPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      widget.submitAuth(
        _userEmail.trim(),
        _userPassword.trim(),
        _isLogin,
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 683.5,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 10),
                    child: Text(
                      _isLogin ? 'Sign In' : 'Sign Up',
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 15,
                  ),
                  height: 5,
                  width: 100,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Please Sign In to your Accout to continue',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: TextFormField(
                        key: const ValueKey('email'),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _userEmail = value!;
                        },
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'email',
                          prefixIcon: Icon(
                            FontAwesomeIcons.solidEnvelope,
                            color: kPrimaryColor,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: TextFormField(
                        key: const ValueKey('password'),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 7) {
                            return 'Password must be at least 7 characters long.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _userPassword = value!;
                        },
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: 'password',
                          prefixIcon: const Icon(
                            FontAwesomeIcons.lock,
                            color: kPrimaryColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _secureText = !_secureText;
                              });
                            },
                            icon: Icon(
                              _secureText
                                  ? Icons.remove_red_eye
                                  : Icons.security,
                              color: kPrimaryColor,
                            ),
                          ),
                          border: InputBorder.none,
                          focusColor: kPrimaryColor,
                        ),
                        obscureText: _secureText,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    if (!_isLogin)
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: TextFormField(
                          key: const ValueKey('confirm-password'),
                          validator: (value) {
                            if (value!.isEmpty ||
                                _userPassword != _confirmPassword) {
                              return 'Password do not match';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _confirmPassword = value!;
                          },
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            hintText: 'Confirm password',
                            prefixIcon: const Icon(
                              FontAwesomeIcons.lock,
                              color: kPrimaryColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _confirmSecureText = !_confirmSecureText;
                                });
                              },
                              icon: Icon(
                                _confirmSecureText
                                    ? Icons.remove_red_eye
                                    : Icons.security,
                                color: kPrimaryColor,
                              ),
                            ),
                            border: InputBorder.none,
                            focusColor: kPrimaryColor,
                          ),
                          obscureText: _confirmSecureText,
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                if (widget.isLoading)
                  const Center(child: CircularProgressIndicator()),
                if (!widget.isLoading)
                  Center(
                    child: InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: kPrimaryColor,
                        ),
                        child: Text(
                          _isLogin ? 'Sign In' : 'Sing Up',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onTap: _trySubmit,
                    ),
                  ),
                const SizedBox(
                  height: 25,
                ),
                if (!widget.isLoading)
                  Center(
                    child: Text(
                      _isLogin
                          ? 'Do you have an accout?'
                          : 'Already have account?',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                if (!widget.isLoading)
                  Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(
                        _isLogin ? 'Sign Up' : 'Sign In',
                        style: const TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ),
                const Spacer(),
                ClipPath(
                  clipper: AuthClipper(),
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      0,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
