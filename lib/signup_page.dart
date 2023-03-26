// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_music_selection/social_login_button.dart';

import 'mainapp.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  String? _email;
  String? _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 46),
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
                keyboardType: TextInputType.emailAddress,
                onSaved: (newValue) {
                  _email = newValue;
                },
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
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(48),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(48),
                    borderSide: const BorderSide(color: Colors.blue),
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
                onPressed: () => _onSignUp(context),
                buttonText: "Sign Up",
                buttonColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSignUp(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: _email!, password: _password!);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainApp()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "The email you entered is already in use. Please login.",
              ),
              backgroundColor: Colors.grey,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Something went wrong. Please try again"),
              backgroundColor: Colors.grey,
            ),
          );
        }
      }
    }
  }
}
