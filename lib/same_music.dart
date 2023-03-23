import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:like_button/like_button.dart';

class Sayfa extends StatelessWidget {
  Sayfa({super.key});
  bool isLiked = false;
  int likeCount = 12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Same music with you",
      )),
      body: Column(children: [
        Card(
          color: Colors.blue.shade100,
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.safety_check),
            ),
            title: const Text("A kişisi"),
            subtitle: const Text("dinlediği müziğin ismi"),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              Ink(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(7)),
                width: 45,
                height: 28,
                child: Icon(Icons.play_arrow),
              ),
              OutlinedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.message,
                    color: Colors.black,
                  )),
            ]),
          ),
        ),
        const Divider(
          color: Colors.black,
          height: 2,
          thickness: 1,
          indent: 50,
          endIndent: 50,
        ),
        Card(
          color: Colors.blue.shade100,
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.safety_check),
            ),
            title: const Text("A kişisi"),
            subtitle: const Text("dinlediği müziğin ismi"),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              OutlinedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.message,
                    color: Colors.black,
                  )),
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
                    return Text(likeCount.toString(),
                        style: TextStyle(
                            color: color,
                            fontSize: 20,
                            fontWeight: FontWeight.bold));
                  },
                  onTap: (isLiked) async {
                    this.isLiked = !isLiked;
                    likeCount += this.isLiked ? 1 : -1;
                    return !isLiked;
                  })
            ]),
          ),
        ),
        const Divider(
          color: Colors.black,
          thickness: 1,
          indent: 50,
          endIndent: 50,
        )
      ]),
    );
  }
}
