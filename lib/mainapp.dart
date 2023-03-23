// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:smart_music_selection/home_page.dart';
import 'package:smart_music_selection/login_page.dart';
import 'package:smart_music_selection/same_music.dart';
import 'package:smart_music_selection/veriler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<Color> butonColorsList = [Colors.red, Colors.white];

  double stopFirstColor = 1;
  double stopSecondColor = 0;
  late List<double> stopsList;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    stopsList = [stopFirstColor, stopSecondColor];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () async {
                    if (await GoogleSignIn().isSignedIn()) {
                      await GoogleSignIn().disconnect();
                    }
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  icon: const Icon(Icons.logout),
                ),
              ),
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
              Container(
                alignment: const Alignment(0, -0.5),
                child: GestureDetector(
                  onLongPressStart: (_) {
                    _onLongPressStart();
                  },
                  onLongPressEnd: (_) {
                    _onLongPressEnd();
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: butonColorsList,
                        stops: stopsList,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'AE',
                        style: TextStyle(
                          fontFamily: 'PermanentMarker',
                          color: Colors.black,
                          fontSize: 90,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                "Long Press the Button to explore yourself",
                style: TextStyle(
                  fontFamily: "PermanentMarker",
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _renkDoldur() {
    setState(() {
      stopFirstColor -= 0.1;
      stopSecondColor += 0.1;
      stopsList = [stopFirstColor, stopSecondColor];
    });
  }

  void _renkBosalt() {
    setState(() {
      stopFirstColor += 0.1;
      stopSecondColor -= 0.1;
      stopsList = [stopFirstColor, stopSecondColor];
    });
  }

  void _onLongPressStart() async {
    //await SpotifySdk.play(spotifyUri: 'spotify:track:58kNJana4w5BIjlZE2wq5m');
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        if (stopSecondColor < 1) {
          _renkDoldur();
        } else {
          timer.cancel();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
      },
    );
  }

  void _onLongPressEnd() {
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        if (stopFirstColor < 1) {
          _renkBosalt();
        } else {
          timer.cancel();
        }
      },
    );
  }
}
