import 'package:cc206_todo_list_/features/components/bodylogin.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return const Scaffold(
      body: Body(),
    );
  }
}

