import 'package:examples_of_context/examples.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Context learning",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const Examples(),
    );
  }
}

