import 'package:flutter/material.dart';

import '../../widgets/people_music_card.dart';

class PeopleLikeYouPage extends StatelessWidget {
  const PeopleLikeYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PeopleMusicCard(
            title: "Angelina",
            subtitle: "Blinding Lights - The Weekend",
            assetName: "assets/images/example_avatar1.png",
            url: "https://music.youtube.com/watch?v=J7p4bzqLvCw",
          ),
          PeopleMusicCard(
            title: "Emilia",
            subtitle: "Shape of You - Ed Sheeran",
            assetName: "assets/images/example_avatar2.png",
            url: "https://music.youtube.com/watch?v=JGwWNGJdvx8",
          ),
          PeopleMusicCard(
            title: "Alex",
            subtitle: "Dance Monkey - Tones and I",
            assetName: "assets/images/example_avatar3.png",
            url: "https://music.youtube.com/watch?v=q0hyYWKXF0Q",
          ),
          PeopleMusicCard(
            title: "Georgina",
            subtitle: "Someone You Loved - Lewis Capaldi",
            assetName: "assets/images/example_avatar4.png",
            url: "https://music.youtube.com/watch?v=zABLecsR5UE",
          ),
          PeopleMusicCard(
            title: "Nicolo",
            subtitle: "Rockstar - Post Malone ft. 21 Savage",
            assetName: "assets/images/example_avatar5.png",
            url: "https://music.youtube.com/watch?v=AaxFIY-cWH0",
          ),
          PeopleMusicCard(
            title: "Frank",
            subtitle: "Sunflower - Post Malone and Swae Lee",
            assetName: "assets/images/example_avatar6.png",
            url: "https://music.youtube.com/watch?v=ApXoWvfEYVU",
          ),
          PeopleMusicCard(
            title: "Fernando",
            subtitle: "Lose Yourself - Eminem",
            assetName: "assets/images/example_avatar7.png",
            url: "https://music.youtube.com/watch?v=4wOLVrGHiIU",
          ),
          PeopleMusicCard(
            title: "Jennifer",
            subtitle: "Closer - The Chainsmokers ft. Halsey",
            assetName: "assets/images/example_avatar8.png",
            url: "https://music.youtube.com/watch?v=r7zTKRonHXM",
          ),
          PeopleMusicCard(
            title: "Magnus",
            subtitle: "Stay - The Kid Laroi ve Justin Bieber",
            assetName: "assets/images/example_avatar9.png",
            url: "https://music.youtube.com/watch?v=kTJczUoc26U",
          ),
          PeopleMusicCard(
            title: "Albert",
            subtitle: "Believer - Imagine Dragons",
            assetName: "assets/images/example_avatar10.png",
            url: "https://music.youtube.com/channel/UC0aXrjVxG5pZr99v77wZdPQ",
          ),
        ],
      ),
    );
  }
}
