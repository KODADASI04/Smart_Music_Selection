import 'package:flutter/material.dart';
import 'package:smart_music_selection/people_music_card.dart';

class SuggestedMusicPage extends StatelessWidget {
  const SuggestedMusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PeopleMusicCard(
            title: "The Weekend",
            subtitle: "Blinding Lights",
            assetName: "assets/images/example_avatar1.png",
            url: "https://m.youtube.com/watch?v=4NRXx6U8ABQ",
          ),
          PeopleMusicCard(
            title: "Shape of You",
            subtitle: "Ed Sheeran",
            assetName: "assets/images/example_avatar2.png",
            url: "https://m.youtube.com/watch?v=JGwWNGJdvx8",
          ),
          PeopleMusicCard(
            title: "Dance Monkey",
            subtitle: "Tones and I",
            assetName: "assets/images/example_avatar3.png",
            url: "https://m.youtube.com/watch?v=q0hyYWKXF0Q",
          ),
          PeopleMusicCard(
            title: "Someone You Loved",
            subtitle: "Lewis Capaldi",
            assetName: "assets/images/example_avatar4.png",
            url: "https://m.youtube.com/watch?v=zABLecsR5UE",
          ),
          PeopleMusicCard(
            title: "Rockstar",
            subtitle: "Post Malone ft. 21 Savage",
            assetName: "assets/images/example_avatar5.png",
            url: "https://m.youtube.com/watch?v=UceaB4D0jpo",
          ),
          PeopleMusicCard(
            title: "Sunflower",
            subtitle: "Post Malone and Swae Lee",
            assetName: "assets/images/example_avatar6.png",
            url: "https://m.youtube.com/watch?v=ApXoWvfEYVU",
          ),
          PeopleMusicCard(
            title: "One Dance",
            subtitle: "Drake ft. Wizkid and Kyla",
            assetName: "assets/images/example_avatar7.png",
            url: "https://m.youtube.com/watch?v=vcer12OFU2g",
          ),
          PeopleMusicCard(
            title: "Closer",
            subtitle: "The Chainsmokers ft. Halsey",
            assetName: "assets/images/example_avatar8.png",
            url: "https://m.youtube.com/watch?v=0zGcUoRlhmw",
          ),
          PeopleMusicCard(
            title: "Stay",
            subtitle: "The Kid Laroi ve Justin Bieber",
            assetName: "assets/images/example_avatar9.png",
            url: "https://m.youtube.com/watch?v=kTJczUoc26U",
          ),
          PeopleMusicCard(
            title: "Believer",
            subtitle: "Imagine Dragons",
            assetName: "assets/images/example_avatar10.png",
            url: "https://m.youtube.com/watch?v=7wtfhZwyrcc",
          ),
        ],
      ),
    );
  }
}
