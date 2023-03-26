import 'dart:math';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:url_launcher/url_launcher.dart';

class MusicExpansionTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final String youtubeUrl;
  final String imageUrl;

  const MusicExpansionTile({
    required this.title,
    required this.subtitle,
    required this.youtubeUrl,
    required this.imageUrl,
    super.key,
  });

  @override
  State<MusicExpansionTile> createState() => _MusicExpansionTileState();
}

class _MusicExpansionTileState extends State<MusicExpansionTile> {
  bool isLiked = false;
  bool isImageLoaded = true;

  @override
  Widget build(BuildContext context) {
    int likeCount = Random().nextInt(1000);
    isLiked = false;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              widget.imageUrl,
            ),
            opacity: 0.5,
            onError: (exception, stackTrace) {
              setState(() {
                isImageLoaded = false;
              });
            },
          ),
        ),
        child: Card(
          elevation: 12,
          color: isImageLoaded ? Colors.transparent : Colors.blueGrey.shade200,
          child: ExpansionTile(
            collapsedIconColor: Colors.white,
            title: Text(
              widget.title,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              widget.subtitle,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
            children: [
              const Text(
                "Suggested Mood: Happy",
                style: TextStyle(
                  fontFamily: "PermanentMaker",
                  fontSize: 18,
                  color: Colors.white,
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
                        await launchUrl(Uri.parse(widget.youtubeUrl));
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
      ),
    );
  }
}
