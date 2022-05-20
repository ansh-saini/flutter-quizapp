import 'package:flutter/material.dart';
import 'package:quizapp/shared/bottom_nav.dart';

class Topics extends StatelessWidget {
  const Topics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNaviagation(),
    );
  }
}
