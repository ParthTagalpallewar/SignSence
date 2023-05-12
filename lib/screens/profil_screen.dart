import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _firebaseAuth = FirebaseAuth.instance;

  var email = "User Email";

  Future<User?> _getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }

  @override
  void initState() {
    super.initState();

    _getCurrentUser().then((user) {
      if (user != null) {
        setState(() {
          email = user.email!;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Text(email),
      ),
    );
  }
}
