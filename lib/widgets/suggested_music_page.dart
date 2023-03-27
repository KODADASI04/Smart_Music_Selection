// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'music_expansion_tile.dart';

class SuggestedMusicPage extends StatelessWidget {
  SuggestedMusicPage({super.key});
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    isLiked = false;
    return SingleChildScrollView(
      child: Column(
        children: const [
          MusicExpansionTile(
            title: "Blinding Lights",
            subtitle: "The Weeknd",
            musicUrl: "https://music.youtube.com/watch?v=J7p4bzqLvCw",
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/en/e/e6/The_Weeknd_-_Blinding_Lights.png",
          ),
          MusicExpansionTile(
            title: "Shape of You",
            subtitle: "Ed Sheeran",
            musicUrl: "https://music.youtube.com/watch?v=JGwWNGJdvx8",
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/tr/4/4f/Shape_of_You_single_cover.jpg",
          ),
          MusicExpansionTile(
            title: "Dance Monkey",
            subtitle: "Tones and I",
            musicUrl: "https://music.youtube.com/watch?v=q0hyYWKXF0Q",
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/en/1/1f/Dance_Monkey_by_Tones_and_I.jpg",
          ),
          MusicExpansionTile(
            title: "Someone You Loved",
            subtitle: "Lewis Capaldi",
            musicUrl: "https://music.youtube.com/watch?v=zABLecsR5UE",
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/en/a/a6/Lewis_Capaldi_-_Someone_You_Loved.png",
          ),
          MusicExpansionTile(
            title: "Rockstar",
            subtitle: "Post Malone ft. 21 Savage",
            musicUrl: "https://music.youtube.com/watch?v=AaxFIY-cWH0",
            imageUrl: "https://upload.wikimedia.org/wikipedia/en/1/1c/PostMaloneRockstar.jpg",
          ),
          MusicExpansionTile(
            title: "Sunflower",
            subtitle: "Post Malone and Swae Lee",
            musicUrl: "https://music.youtube.com/watch?v=ApXoWvfEYVU",
            imageUrl: "",
          ),
          MusicExpansionTile(
            title: "Lose Yourself",
            subtitle: "Eminem",
            musicUrl: "https://music.youtube.com/watch?v=4wOLVrGHiIU",
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/tr/d/d6/Lose_Yourself.jpg",
          ),
          MusicExpansionTile(
            title: "Closer",
            subtitle: "The Chainsmokers ft. Halsey",
            musicUrl: "https://music.youtube.com/watch?v=r7zTKRonHXM",
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/tr/c/c2/Closer_-_TheChainsmokers.png",
          ),
          MusicExpansionTile(
            title: "Stay",
            subtitle: "The Kid Laroi ve Justin Bieber",
            musicUrl: "https://music.youtube.com/watch?v=kTJczUoc26U",
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/en/0/0c/The_Kid_Laroi_and_Justin_Bieber_-_Stay.png",
          ),
          MusicExpansionTile(
            title: "Believer",
            subtitle: "Imagine Dragons",
            musicUrl:
                "https://music.youtube.com/channel/UC0aXrjVxG5pZr99v77wZdPQ",
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/en/5/5c/Imagine-Dragons-Believer-art.jpg",
          ),
        ],
      ),
    );
  }
}
