import 'package:flutter/material.dart';

void main() { // This is the entry point to the dart program
  runApp(const MainApp()); // The runApp is a part of the flutter SDK and it takes a widget and makes it the root of the widget tree. In this case, we are passing an instance of MainApp.
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
