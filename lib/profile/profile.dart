import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/services/auth.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: ElevatedButton.icon(
          onPressed: () async {
            await AuthService().signOut();
            Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
          },
          label: const Text("Sign Out"),
          icon: const Icon(
            FontAwesomeIcons.signOutAlt,
            size: 20,
          ),
        ));
  }
}
