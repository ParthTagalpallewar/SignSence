import 'package:app/screens/Second.dart';
import 'package:app/screens/learning_screen.dart';
import 'package:app/screens/profil_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class DashBoradScreen extends StatefulWidget {
  const DashBoradScreen({Key? key}) : super(key: key);

  @override
  State<DashBoradScreen> createState() => _DashBoradScreenState();
}

class _DashBoradScreenState extends State<DashBoradScreen> {

  final pages = {HomeScreen(), Second(), LearningScreen(), ProfileScreen()};
  var index = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: pages.elementAt(index),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white10,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black45,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Second"
          ),BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Second"
          ),BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile"
          ),
        ],
        currentIndex: index,
        onTap: _onItemTapped,
      ),

    );
  }

  void _onItemTapped(int indexx) {
    setState(() {
      index = indexx;
    });
  }
}
