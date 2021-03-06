import 'package:flutter/material.dart';
import 'package:quizapp/shared/bottom_nav.dart';
import 'package:quizapp/shared/loading.dart';
import 'package:quizapp/shared/error.dart';
import 'package:quizapp/services/firestore.dart';
import 'package:quizapp/services/models.dart';
import 'package:quizapp/topics/drawer.dart';
import 'package:quizapp/topics/topic_item.dart';

class Topics extends StatelessWidget {
  const Topics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
        future: FirestoreService().getTopics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadinScreen();
          } else if (snapshot.hasError) {
            return ErrorScreen(message: snapshot.error.toString());
          } else if (snapshot.hasData) {
            var topics = snapshot.data!;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepPurple,
                title: const Text("Topics"),
              ),
              drawer: TopicDrawer(topics: topics),
              body: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                children: topics.map((topic) => TopicItem(topic: topic)).toList(),
              ),
              bottomNavigationBar: const BottomNaviagation(),
            );
          } else {
            return const Text('No topics found in Firestore. Check database');
          }
        });
  }
}
