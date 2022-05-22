import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/services/auth.dart';
import 'package:quizapp/services/models.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/shared/error.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final report = Provider.of<Report>(context);
    final user = AuthService().user;

    if (user == null) {
      return const ErrorScreen(message: "User not found");
    }

    final name = user.displayName is String ? '${user.displayName!.split(' ')[0]}\n${user.displayName!.split(' ')[1]}' : "Guest";

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text("Profile"),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    user.photoURL is String
                        ? CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(user.photoURL!),
                          )
                        : CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.deepPurple,
                            child: Text(
                              name,
                              style: const TextStyle(color: Colors.white),
                              softWrap: true,
                            ),
                          ),
                    if (user.photoURL != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          user.displayName ?? "Guest",
                          style: const TextStyle(fontSize: 30),
                          softWrap: true,
                        ),
                      ),
                    const Text(
                      "Quizzes Completed",
                      style: TextStyle(fontSize: 20),
                      softWrap: true,
                    ),
                    Text(
                      report.total.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    await AuthService().signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                  },
                  label: const Text("Logout"),
                  icon: const Icon(
                    FontAwesomeIcons.signOutAlt,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
