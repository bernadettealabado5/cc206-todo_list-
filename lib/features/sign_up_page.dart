import 'package:flutter/material.dart';

class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
       Text("Sign Up"), TextField(),TextFormField()
      ],)

    );
  }
}

