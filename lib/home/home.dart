import 'package:flutter/material.dart';
import 'package:quizapp/shared/bottom_nav.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text(
            "Go to about",
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: () => Navigator.pushNamed(context, '/about'),
        ),
      ),
      bottomNavigationBar: const BottomNaviagation(),
    );
  }
}
