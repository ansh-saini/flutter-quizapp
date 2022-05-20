import 'package:flutter/material.dart';

import 'package:quizapp/home/home.dart' show Home;
import 'package:quizapp/login/login.dart' show Login;
import 'package:quizapp/topics/topics.dart' show Topics;
import 'package:quizapp/profile/profile.dart' show Profile;
import 'package:quizapp/about/about.dart' show About;

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (context) => const Home(),
  '/login': (context) => const Login(),
  '/topics': (context) => const Topics(),
  '/profile': (context) => const Profile(),
  '/about': (context) => const About(),
};
