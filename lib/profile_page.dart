import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:smart_music_selection/home_page.dart';
import 'package:smart_music_selection/people_music_card.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Profile"),
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
            SizedBox(
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
            SizedBox(height: 35),
            Row(
              children: [
                SizedBox(
                  width: 78,
                ),
                Column(
                  children: [
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
                SizedBox(
                  width: 120,
                ),
                Column(
                  children: [
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
            SizedBox(
              height: 25,
            ),
            MusicCard(
                title: "Take Me Out",
                subtitle: "Franz Ferdinand",
                assetName: "assets/images/example_avatar1.png"),
            MusicCard(
                title: "Bring Me To Life",
                subtitle: "Evanescence",
                assetName: "assets/images/example_avatar1.png"),
            MusicCard(
                title: "I Hate Everything About You",
                subtitle: "Three Days Grace",
                assetName: "assets/images/example_avatar1.png"),
            MusicCard(
                title: "Numb",
                subtitle: "Linkin Park",
                assetName: "assets/images/example_avatar1.png"),
            MusicCard(
                title: "It's My Life",
                subtitle: "Bon Jovi",
                assetName: "assets/images/example_avatar1.png"),
            MusicCard(
                title: "Kuzu Kuzu",
                subtitle: "Tarkan",
                assetName: "assets/images/example_avatar1.png"),
            MusicCard(
                title: "Survivor",
                subtitle: "Destiny's Child",
                assetName: "assets/images/example_avatar1.png"),
            MusicCard(
                title: "Shape Of You",
                subtitle: "Ed Sheeran",
                assetName: "assets/images/example_avatar1.png"),
            MusicCard(
                title: "Whenever,Whereever",
                subtitle: "Shakira",
                assetName: "assets/images/example_avatar1.png"),
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
  MusicCard(
      {required this.title,
      required this.subtitle,
      required this.assetName,
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
        child: ListTile(
          leading: CircleAvatar(
            child: Image.asset(assetName),
          ),
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(title),
          ),
          subtitle: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(subtitle),
          ),
        ),
      ),
    );
  }
}
