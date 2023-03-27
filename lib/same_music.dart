import 'package:flutter/material.dart';

import 'people_music_card.dart';

class PeopleLikeYouPage extends StatelessWidget {
  const PeopleLikeYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PeopleMusicCard(
            title: "Person 1",
            subtitle: "Blinding Lights - The Weekend",
            assetName: "assets/images/example_avatar1.png",
            url: "https://music.youtube.com/watch?v=J7p4bzqLvCw",
          ),
          PeopleMusicCard(
            title: "Person 2",
            subtitle: "Shape of You - Ed Sheeran",
            assetName: "assets/images/example_avatar2.png",
            url: "https://music.youtube.com/watch?v=JGwWNGJdvx8",
          ),
          PeopleMusicCard(
            title: "Person 3",
            subtitle: "Dance Monkey - Tones and I",
            assetName: "assets/images/example_avatar3.png",
            url: "https://music.youtube.com/watch?v=q0hyYWKXF0Q",
          ),
          PeopleMusicCard(
            title: "Person 4",
            subtitle: "Someone You Loved - Lewis Capaldi",
            assetName: "assets/images/example_avatar4.png",
            url: "https://music.youtube.com/watch?v=zABLecsR5UE",
          ),
          PeopleMusicCard(
            title: "Person 5",
            subtitle: "Rockstar - Post Malone ft. 21 Savage",
            assetName: "assets/images/example_avatar5.png",
            url: "https://music.youtube.com/watch?v=AaxFIY-cWH0",
          ),
          PeopleMusicCard(
            title: "Person 6",
            subtitle: "Sunflower - Post Malone and Swae Lee",
            assetName: "assets/images/example_avatar6.png",
            url: "https://music.youtube.com/watch?v=ApXoWvfEYVU",
          ),
          PeopleMusicCard(
            title: "Person 7",
            subtitle: "Lose Yourself - Eminem",
            assetName: "assets/images/example_avatar7.png",
            url: "https://music.youtube.com/watch?v=4wOLVrGHiIU",
          ),
          PeopleMusicCard(
            title: "Person 8",
            subtitle: "Closer - The Chainsmokers ft. Halsey",
            assetName: "assets/images/example_avatar8.png",
            url: "https://music.youtube.com/watch?v=r7zTKRonHXM",
          ),
          PeopleMusicCard(
            title: "Person 9",
            subtitle: "Stay - The Kid Laroi ve Justin Bieber",
            assetName: "assets/images/example_avatar9.png",
            url: "https://music.youtube.com/watch?v=kTJczUoc26U",
          ),
          PeopleMusicCard(
            title: "Person 10",
            subtitle: "Believer - Imagine Dragons",
            assetName: "assets/images/example_avatar10.png",
            url: "https://music.youtube.com/channel/UC0aXrjVxG5pZr99v77wZdPQ",
          ),
        ],
      ),
    );
  }
}
