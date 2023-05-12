import 'package:flutter/material.dart';

class LearningDetailsScreen extends StatefulWidget {
   String word;

   LearningDetailsScreen(this.word, {Key? key}) : super(key: key);

  @override
  State<LearningDetailsScreen> createState() => _LearningDetailsScreenState();
}

class _LearningDetailsScreenState extends State<LearningDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Details Screen"),
      ),
      body: Center(
        //todo change url
        child: Image.network(
            'https://miro.medium.com/v2/resize:fit:3944/format:webp/1*Ky9ahExGiwMw-DjteoyfTQ.png',
            height: 400,
            width: 550
        ),
      ),
    );
  }
}
