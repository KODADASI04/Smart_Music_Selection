// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:url_launcher/url_launcher.dart';

class SuggestedMusicPage extends StatelessWidget {
  SuggestedMusicPage({super.key});
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    isLiked = false;
    return SingleChildScrollView(
      child: Column(
        children: [
          _musicExpansionTile(
            title: "The Weekend",
            subtitle: "Blinding Lights",
            url: "https://m.youtube.com/watch?v=4NRXx6U8ABQ",
          ),
          _musicExpansionTile(
            title: "Shape of You",
            subtitle: "Ed Sheeran",
            url: "https://m.youtube.com/watch?v=JGwWNGJdvx8",
          ),
          _musicExpansionTile(
            title: "Dance Monkey",
            subtitle: "Tones and I",
            url: "https://m.youtube.com/watch?v=q0hyYWKXF0Q",
          ),
          _musicExpansionTile(
            title: "Someone You Loved",
            subtitle: "Lewis Capaldi",
            url: "https://m.youtube.com/watch?v=zABLecsR5UE",
          ),
          _musicExpansionTile(
            title: "Rockstar",
            subtitle: "Post Malone ft. 21 Savage",
            url: "https://m.youtube.com/watch?v=UceaB4D0jpo",
          ),
          _musicExpansionTile(
            title: "Sunflower",
            subtitle: "Post Malone and Swae Lee",
            url: "https://m.youtube.com/watch?v=ApXoWvfEYVU",
          ),
          _musicExpansionTile(
            title: "One Dance",
            subtitle: "Drake ft. Wizkid and Kyla",
            url: "https://m.youtube.com/watch?v=vcer12OFU2g",
          ),
          _musicExpansionTile(
            title: "Closer",
            subtitle: "The Chainsmokers ft. Halsey",
            url: "https://m.youtube.com/watch?v=0zGcUoRlhmw",
          ),
          _musicExpansionTile(
            title: "Stay",
            subtitle: "The Kid Laroi ve Justin Bieber",
            url: "https://m.youtube.com/watch?v=kTJczUoc26U",
          ),
          _musicExpansionTile(
            title: "Believer",
            subtitle: "Imagine Dragons",
            url: "https://m.youtube.com/watch?v=7wtfhZwyrcc",
          ),
        ],
      ),
    );
  }

  Widget _musicExpansionTile(
      {required String title, required String subtitle, required String url}) {
    int likeCount = Random().nextInt(1000);
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        elevation: 12,
        color: Colors.blueGrey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: ExpansionTile(
          title: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
          ),
          children: [
            const Text(
              "Suggested Mood: Happy",
              style: TextStyle(
                fontFamily: "PermanentMaker",
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  LikeButton(
                    size: 27,
                    isLiked: isLiked,
                    likeCount: likeCount,
                    likeBuilder: (isLiked) {
                      final color = isLiked ? Colors.red : Colors.grey;
                      return Icon(Icons.favorite, color: color, size: 27);
                    },
                    countBuilder: (count, isLiked, text) {
                      final color = isLiked ? Colors.red : Colors.grey;
                      return Text(
                        text,
                        style: TextStyle(
                            color: color,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      );
                    },
                    onTap: (isLiked) async {
                      this.isLiked = !isLiked;
                      likeCount += this.isLiked ? 1 : -1;
                      return !isLiked;
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(Uri.parse(url));
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      width: 45,
                      height: 28,
                      child: const Icon(Icons.play_arrow),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
