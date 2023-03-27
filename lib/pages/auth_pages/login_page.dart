// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_music_selection/pages/auth_pages/signup_page.dart';
import 'package:smart_music_selection/widgets/social_login_button.dart';

import '../mainapp.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  String? _email;

  String? _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 56),
                  child: Text(
                    "AE Music",
                    style: TextStyle(
                        fontFamily: "PermanentMarker",
                        color: Colors.black,
                        fontSize: 42),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Music is Your Life",
                  style: TextStyle(
                    fontFamily: "PermanentMarker",
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7,
                ),
                TextFormField(
                  onSaved: (newValue) {
                    _email = newValue;
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.mail),
                    prefixIconColor: Colors.grey,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48),
                      borderSide: const BorderSide(color: Colors.red),
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
                  obscureText: true,
                  onSaved: (newValue) {
                    _password = newValue;
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    prefixIconColor: Colors.grey,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48),
                      borderSide: const BorderSide(color: Colors.red),
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
                SocialLoginButton(
                  onPressed: () => _onLoginWithEmail(context),
                  buttonText: "Login",
                  buttonColor: Colors.red,
                ),
                const SizedBox(
                  height: 15,
                ),
                SocialLoginButton(
                  onPressed: () => _onGoogleSignIn(context),
                  buttonText: "Login With Google",
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                  buttonIcon: Image.asset("assets/images/google-logo.png"),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Don't have an account",
                  style: TextStyle(color: Colors.black),
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  ),
                  child: const Text("Sign Up"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context,
      {String text = "Something went wrong. Please try again"}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Colors.grey,
      ),
    );
  }

  Future<void> _onLoginWithEmail(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await _firebaseAuth.signInWithEmailAndPassword(
            email: _email!, password: _password!);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainApp()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-not-found") {
          _showSnackBar(context, text: "User not found.Please sign up firstly");
        } else {
          _showSnackBar(context);
        }
      }
    }
  }

  Future<void> _onGoogleSignIn(BuildContext context) async {
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
      _showSnackBar(context);
    }
  }
}
