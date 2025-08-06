// main.dart
import 'package:flutter/material.dart';
import 'package:grocery_store/features/boarding/presentation/pages/boarding_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Store',
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: BoardingPage())),
    );
  }
}
