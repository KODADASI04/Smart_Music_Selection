// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_music_selection/datas_page.dart';
import 'package:smart_music_selection/mainapp.dart';
import 'package:smart_music_selection/map_page.dart';
import 'package:smart_music_selection/same_music.dart';
import 'package:smart_music_selection/suggested_music_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 1;

  List<Widget> pages = [
    const MapPage(),
    const SuggestedMusicPage(),
    PeopleLikeYouPage(),
    const DatasPage()
  ];

  List<String> titles = [
    "Map",
    "Suggested Music for You",
    "People Like You",
    "Your Datas"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: currentIndex == 0
          ? null
          : AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainApp()),
                  );
                },
                icon: const Icon(Icons.arrow_back),
              ),
              title: Text(titles[currentIndex]),
              backgroundColor: Colors.red,
              centerTitle: true,
            ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Map",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: "Suggested Musics",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "People Like You",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_array),
            label: "Datas",
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
