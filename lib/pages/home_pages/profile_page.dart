// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_music_selection/pages/home_pages/home_page.dart';

import '../../widgets/music_expansion_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Your Profile"),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            Center(
              child: CircleAvatar(
                radius: 70,
                child: Image.asset(
                  "assets/images/example_avatar10.png",
                ),
              ),
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 35,
                ),
                Column(
                  children: [
                    Text(
                      (Random().nextInt(1000)).toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                    const Text(
                      "Likes",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                ),
                Column(
                  children: [
                    Text(
                      (Random().nextInt(500) + 100).toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                    const Text(
                      "Explored Music",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Most Listened Musics",
              style: TextStyle(
                fontFamily: "LilitaOne",
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const MusicExpansionTile(
                title: "Take Me Out",
                subtitle: "Franz Ferdinand",
                musicUrl: "https://music.youtube.com/watch?v=Ijk4j-r7qPA",
                imageUrl:
                    "https://upload.wikimedia.org/wikipedia/en/8/8f/Franz-Ferdinand.PNG"),
            const MusicExpansionTile(
              title: "Bring Me To Life",
              subtitle: "Evanescence",
              musicUrl: "https://music.youtube.com/watch?v=3YxaaGgTQYM",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/tr/9/98/Bring_Me_To_Life.jpg",
            ),
            const MusicExpansionTile(
              title: "I Hate Everything About You",
              subtitle: "Three Days Grace",
              musicUrl: "https://music.youtube.com/watch?v=d8ekz_CSBVg",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/en/f/ff/Three_days_grace_i_hate_everything_about_you.png",
            ),
            const MusicExpansionTile(
              title: "Numb",
              subtitle: "Linkin Park",
              musicUrl: "https://music.youtube.com/watch?v=kXYiU_JCYtU",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/tr/b/b9/Linkin_Park_-_Numb_CD_cover.jpg",
            ),
            const MusicExpansionTile(
              title: "It's My Life",
              subtitle: "Bon Jovi",
              musicUrl: "https://music.youtube.com/watch?v=vx2u5uUu3DE",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/tr/c/c1/BonJoviItsMyLifeCDSingleCover.jpg",
            ),
            const MusicExpansionTile(
              title: "Kuzu Kuzu",
              subtitle: "Tarkan",
              musicUrl: "https://music.youtube.com/watch?v=NAHRpEqgcL4",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/tr/0/0a/Tarkan_Kuzu_Kuzu_2001_single.jpg",
            ),
            const MusicExpansionTile(
              title: "Survivor",
              subtitle: "Destiny's Child",
              musicUrl: "https://music.youtube.com/watch?v=aVJi5jj-zl0",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/en/9/99/Destiny%27s_Child_%E2%80%93_Survivor.jpg",
            ),
            const MusicExpansionTile(
              title: "Shape Of You",
              subtitle: "Ed Sheeran",
              musicUrl: "https://music.youtube.com/watch?v=JGwWNGJdvx8",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/tr/4/4f/Shape_of_You_single_cover.jpg",
            ),
            const MusicExpansionTile(
              title: "Whenever,Whereever",
              subtitle: "Shakira",
              musicUrl: "https://music.youtube.com/watch?v=weRHyjj34ZE",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/tr/f/fb/WheneverWherever.jpg",
            ),
          ],
        ),
      ),
    );
  }
}
