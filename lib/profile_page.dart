// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:smart_music_selection/home_page.dart';

import 'music_expansion_tile.dart';

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
              children: [
                const SizedBox(
                  width: 78,
                ),
                Column(
                  children: const [
                    Text(
                      "95",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                    Text(
                      "Likes",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  width: 120,
                ),
                Column(
                  children: const [
                    Text(
                      "270",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                    Text(
                      "Count",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const MusicExpansionTile(
                title: "Take Me Out",
                subtitle: "Franz Ferdinand",
                youtubeUrl: "https://m.youtube.com/watch?v=Ijk4j-r7qPA",
                imageUrl:
                    "https://upload.wikimedia.org/wikipedia/en/8/8f/Franz-Ferdinand.PNG"),
            const MusicExpansionTile(
              title: "Bring Me To Life",
              subtitle: "Evanescence",
              youtubeUrl: "https://m.youtube.com/watch?v=3YxaaGgTQYM",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/tr/9/98/Bring_Me_To_Life.jpg",
            ),
            const MusicExpansionTile(
              title: "I Hate Everything About You",
              subtitle: "Three Days Grace",
              youtubeUrl: "https://m.youtube.com/watch?v=d8ekz_CSBVg",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/en/f/ff/Three_days_grace_i_hate_everything_about_you.png",
            ),
            const MusicExpansionTile(
              title: "Numb",
              subtitle: "Linkin Park",
              youtubeUrl: "https://m.youtube.com/watch?v=kXYiU_JCYtU",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/tr/b/b9/Linkin_Park_-_Numb_CD_cover.jpg",
            ),
            const MusicExpansionTile(
              title: "It's My Life",
              subtitle: "Bon Jovi",
              youtubeUrl: "https://m.youtube.com/watch?v=vx2u5uUu3DE",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/tr/c/c1/BonJoviItsMyLifeCDSingleCover.jpg",
            ),
            const MusicExpansionTile(
              title: "Kuzu Kuzu",
              subtitle: "Tarkan",
              youtubeUrl: "https://m.youtube.com/watch?v=NAHRpEqgcL4",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/tr/0/0a/Tarkan_Kuzu_Kuzu_2001_single.jpg",
            ),
            const MusicExpansionTile(
              title: "Survivor",
              subtitle: "Destiny's Child",
              youtubeUrl: "https://m.youtube.com/watch?v=Wmc8bQoL-J0",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/en/9/99/Destiny%27s_Child_%E2%80%93_Survivor.jpg",
            ),
            const MusicExpansionTile(
              title: "Shape Of You",
              subtitle: "Ed Sheeran",
              youtubeUrl: "https://m.youtube.com/watch?v=JGwWNGJdvx8",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/tr/4/4f/Shape_of_You_single_cover.jpg",
            ),
            const MusicExpansionTile(
              title: "Whenever,Whereever",
              subtitle: "Shakira",
              youtubeUrl: "https://m.youtube.com/watch?v=weRHyjj34ZE",
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/tr/f/fb/WheneverWherever.jpg",
            ),
          ],
        ),
      ),
    );
  }
}
