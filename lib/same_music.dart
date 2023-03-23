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
      )
      ),
      body: const Card(
        color: Colors.amber.shade100,
        child: ListTile(leading: CircleAvatar(child: Icon(Icons.safety_check),),
        title: Text ("A kişisi"),
        subtitle: Text("dinlediği müziğin ismi"),
        trailing: Row(children: [
          Container()
          OutlinedButton(onPressed: onPressed, child: Icon(Icons.message))

        ]),
        
        
        
        ),
        
      ),
    );
  }
}
