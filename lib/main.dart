import 'package:smart_music_selection/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.dark,
        hintColor: Colors.grey,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
