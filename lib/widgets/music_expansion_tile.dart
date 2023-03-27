import 'dart:math';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:url_launcher/url_launcher.dart';

class MusicExpansionTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final String musicUrl;
  final String imageUrl;

  const MusicExpansionTile({
    required this.title,
    required this.subtitle,
    required this.musicUrl,
    required this.imageUrl,
    super.key,
  });

  @override
  State<MusicExpansionTile> createState() => _MusicExpansionTileState();
}

class _MusicExpansionTileState extends State<MusicExpansionTile> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    int likeCount = Random().nextInt(1000);
    isLiked = false;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              widget.imageUrl,
            ),
            opacity: 0.75,
          ),
        ),
        child: Card(
          elevation: 12,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
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
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await launchUrl(Uri.parse(widget.musicUrl));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.white30,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              Image.asset("assets/images/yt_music.png"),
                              const Text(
                                "Play On Youtube Music",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
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
