// main.dart
import 'package:cc206_todo_list_/features/constants.dart';
import 'package:cc206_todo_list_/features/login_screen.dart';
import 'package:cc206_todo_list_/features/signup_screen.dart';
import 'package:cc206_todo_list_/features/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SignUpScreen(),
    );
  }
}
