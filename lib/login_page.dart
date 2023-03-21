// ignore_for_file: use_build_context_synchronously

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'mainapp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isStateLogin = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48),
                    ),
                    hintText: "Email",
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if (!EmailValidator.validate(value!)) {
                      return "Please Write a Real Email";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48),
                    ),
                    hintText: "Password",
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Your password length must be at least 6";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  loginText: "Login With Google",
                  signUpText: "Sign Up With Google",
                  onPressed: _onGoogleSignIn,
                  isStateLogin: _isStateLogin,
                ),
                CustomButton(
                  signUpText: "Sign Up",
                  loginText: "Login",
                  onPressed: _onElevatedButtonPressed,
                  isStateLogin: _isStateLogin,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  _isStateLogin
                      ? "Don't have an account"
                      : "Do have an account",
                ),
                TextButton(
                  onPressed: _onTextButtonPressed,
                  child: Text(_isStateLogin ? "Sign Up" : "Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onElevatedButtonPressed() async {
    if (_formKey.currentState!.validate()) {
      if (_isStateLogin) {
        try {
          await _firebaseAuth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainApp()),
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("User not found.Please sign up firstly"),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Something went wrong. Please try again"),
              ),
            );
          }
        }
      } else {
        try {
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainApp()),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Something went wrong. Please try again"),
            ),
          );
        }
      }
    }
  }

  Future<void> _onGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainApp()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong. Please try again"),
        ),
      );
    }
  }

  void _onTextButtonPressed() {
    setState(() {
      _isStateLogin = !_isStateLogin;
    });
  }
}

class CustomButton extends StatelessWidget {
  final String loginText;
  final String signUpText;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isStateLogin;
  const CustomButton(
      {required this.loginText,
      required this.signUpText,
      required this.onPressed,
      required this.isStateLogin,
      this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon),
          if (icon != null) const SizedBox(width: 8),
          Text(isStateLogin ? loginText : signUpText),
        ],
      ),
    );
  }
}
