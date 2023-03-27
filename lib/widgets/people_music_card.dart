// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:url_launcher/url_launcher.dart';

class PeopleMusicCard extends StatelessWidget {
  final String assetName;
  final String title;
  final String subtitle;
  final String url;
  PeopleMusicCard(
      {required this.title,
      required this.subtitle,
      required this.assetName,
      required this.url,
      super.key});

  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    int likeCount = Random().nextInt(1000);
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
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      fontWeight: FontWeight.bold,
                    ),
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
                child: Image.asset("assets/images/yt_music.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
