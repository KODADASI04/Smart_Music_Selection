// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:smart_music_selection/pages/home_pages/datas_page.dart';
import 'package:smart_music_selection/pages/mainapp.dart';
import 'package:smart_music_selection/pages/home_pages/map_page.dart';
import 'package:smart_music_selection/pages/home_pages/profile_page.dart';
import 'package:smart_music_selection/pages/home_pages/similiar_people_page.dart';
import 'package:smart_music_selection/pages/home_pages/suggested_music_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 1;

  List<Widget> pages = [
    const MapPage(),
    SuggestedMusicPage(),
    const PeopleLikeYouPage(),
    const DatasPage()
  ];

  List<String> titles = [
    "Map",
    "Suggested Music for You",
    "Similar Music Listeners",
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
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                  },
                  child: CircleAvatar(
                    child: Image.asset(
                      "assets/images/example_avatar10.png",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 13,
                )
              ],
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
            label: "Similar Music Listeners",
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
