// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:smart_music_selection/home_page.dart';

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
            MusicCard(
                title: "Take Me Out",
                subtitle: "Franz Ferdinand",
                assetName: "assets/images/example_avatar1.png",
                url:
                    "https://upload.wikimedia.org/wikipedia/en/8/8f/Franz-Ferdinand.PNG"),
            MusicCard(
              title: "Bring Me To Life",
              subtitle: "Evanescence",
              assetName:
                  "https://upload.wikimedia.org/wikipedia/tr/9/98/Bring_Me_To_Life.jpg",
              url:
                  "https://upload.wikimedia.org/wikipedia/tr/9/98/Bring_Me_To_Life.jpg",
            ),
            MusicCard(
              title: "I Hate Everything About You",
              subtitle: "Three Days Grace",
              assetName: "assets/images/example_avatar1.png",
              url:
                  "https://upload.wikimedia.org/wikipedia/en/f/ff/Three_days_grace_i_hate_everything_about_you.png",
            ),
            MusicCard(
              title: "Numb",
              subtitle: "Linkin Park",
              assetName: "assets/images/example_avatar1.png",
              url:
                  "https://upload.wikimedia.org/wikipedia/tr/b/b9/Linkin_Park_-_Numb_CD_cover.jpg",
            ),
            MusicCard(
              title: "It's My Life",
              subtitle: "Bon Jovi",
              assetName: "assets/images/example_avatar1.png",
              url:
                  "https://upload.wikimedia.org/wikipedia/tr/c/c1/BonJoviItsMyLifeCDSingleCover.jpg",
            ),
            MusicCard(
              title: "Kuzu Kuzu",
              subtitle: "Tarkan",
              assetName: "assets/images/example_avatar1.png",
              url:
                  "https://upload.wikimedia.org/wikipedia/tr/0/0a/Tarkan_Kuzu_Kuzu_2001_single.jpg",
            ),
            MusicCard(
              title: "Survivor",
              subtitle: "Destiny's Child",
              assetName: "assets/images/example_avatar1.png",
              url:
                  "https://upload.wikimedia.org/wikipedia/en/9/99/Destiny%27s_Child_%E2%80%93_Survivor.jpg",
            ),
            MusicCard(
              title: "Shape Of You",
              subtitle: "Ed Sheeran",
              assetName: "assets/images/example_avatar1.png",
              url:
                  "https://upload.wikimedia.org/wikipedia/tr/4/4f/Shape_of_You_single_cover.jpg",
            ),
            MusicCard(
              title: "Whenever,Whereever",
              subtitle: "Shakira",
              assetName: "assets/images/example_avatar1.png",
              url:
                  "https://upload.wikimedia.org/wikipedia/tr/f/fb/WheneverWherever.jpg",
            ),
          ],
        ),
      ),
    );
  }
}

class MusicCard extends StatelessWidget {
  final String assetName;
  final String title;
  final String subtitle;
  final String url;
  MusicCard(
      {required this.title,
      required this.subtitle,
      required this.assetName,
      required this.url,
      super.key});

  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Card(
        color: Colors.blueGrey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        elevation: 12,
        child: ColorFiltered(
          colorFilter: ColorFilter.matrix([
            0.5,
            0,
            0,
            0,
            0,
            0,
            0.5,
            0,
            0,
            0,
            0,
            0,
            0.5,
            0,
            0,
            0,
            0,
            0,
            1,
            0,
          ]),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
            ),
            child: ListTile(
              leading: Text(
                "1-",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              title: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              subtitle: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  subtitle,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
