// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [const Text("Sign Up"), const TextField(), TextFormField()],
    ));
  }
}
