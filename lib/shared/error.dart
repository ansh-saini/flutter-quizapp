import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String message;

  const ErrorScreen({Key? key, this.message = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
