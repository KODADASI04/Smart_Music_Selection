import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class Sayfa extends StatelessWidget {
  Sayfa({super.key});
  bool isLiked = false;
  int likeCount = 12;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        peopleCard(
          "A kişisi",
          "Dinlediği Müziğin İsmi",
          "assets/images/example_avatar1.png",
        ),
        peopleCard(
          "A kişisi",
          "Dinlediği Müziğin İsmi",
          "assets/images/example_avatar2.png",
        ),
        peopleCard(
          "A kişisi",
          "Dinlediği Müziğin İsmi",
          "assets/images/example_avatar3.png",
        ),
        peopleCard(
          "A kişisi",
          "Dinlediği Müziğin İsmi",
          "assets/images/example_avatar4.png",
        ),
        peopleCard(
          "A kişisi",
          "Dinlediği Müziğin İsmi",
          "assets/images/example_avatar5.png",
        ),
        peopleCard(
          "A kişisi",
          "Dinlediği Müziğin İsmi",
          "assets/images/example_avatar6.png",
        ),
        peopleCard(
          "A kişisi",
          "Dinlediği Müziğin İsmi",
          "assets/images/example_avatar7.png",
        ),
        peopleCard(
          "A kişisi",
          "Dinlediği Müziğin İsmi",
          "assets/images/example_avatar8.png",
        ),
        peopleCard(
          "A kişisi",
          "Dinlediği Müziğin İsmi",
          "assets/images/example_avatar9.png",
        ),
        peopleCard(
          "A kişisi",
          "Dinlediği Müziğin İsmi",
          "assets/images/example_avatar10.png",
        ),
      ]),
    );
  }

  Widget peopleCard(String name, String music, String assetName) {
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
          title: Text(name),
          subtitle: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(music),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Ink(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(7)),
                width: 45,
                height: 28,
                child: const Icon(Icons.play_arrow),
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
      ),
    );
  }
}
