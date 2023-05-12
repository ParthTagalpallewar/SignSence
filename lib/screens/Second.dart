import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {

  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: search,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.search),
                hintText: 'Enter a search term',
              ),

            ),
          ),

          Container(
            child: Image.network(
                'https://miro.medium.com/v2/resize:fit:3944/format:webp/1*Ky9ahExGiwMw-DjteoyfTQ.png',
                height: 400,
                width: 550
            ),
          )

        ],
      )
    );
  }
}
