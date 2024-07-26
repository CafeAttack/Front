import 'package:flutter/material.dart';
import 'package:cafe_attack/view/LoginView.dart';
import 'package:cafe_attack/view/SignupView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF564646)),
      ),
      home: SignupPage(),
    );
  }
}

