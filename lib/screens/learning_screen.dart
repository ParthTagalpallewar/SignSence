import 'package:app/screens/details_learning_scree.dart';
import 'package:flutter/material.dart';

class LearningScreen extends StatefulWidget {
  const LearningScreen({Key? key}) : super(key: key);

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  final words = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    int c = "a".codeUnitAt(0);
    int end = "z".codeUnitAt(0);
    while (c <= end) {
      var curr = String.fromCharCode(c);

      words.add(curr);

      c++;
    }

    c = "A".codeUnitAt(0);
    end = "Z".codeUnitAt(0);
    while (c <= end) {
      var curr = String.fromCharCode(c);

      words.add(curr);

      c++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learning Screen"),
      ),
      body: ListView.builder(
          itemCount: words.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration:
                  const BoxDecoration(border: Border(bottom: BorderSide())),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LearningDetailsScreen(words[index])));
                },
                title: Text(words[index]),
              ),
            );
          }),
    );
  }
}
