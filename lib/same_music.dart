import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Sayfa extends StatelessWidget {
  const Sayfa({super.key});

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
              OutlinedButton(onPressed: () {}, child: Icon(Icons.message)),
              OutlinedButton(
                  onPressed: () {}, child: Icon(Icons.heart_broken_outlined))
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
