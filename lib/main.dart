import 'package:flutter/material.dart';
import 'package:my_school/screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my_school',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const mainscreen(),
    );
  }
}
