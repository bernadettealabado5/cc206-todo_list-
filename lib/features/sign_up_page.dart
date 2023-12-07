<<<<<<< HEAD
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
=======
// sign_up_page.dart

import 'package:cc206_todo_list_/features/homescreen.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpPage({super.key});
>>>>>>> login-Alabado-Carbonell

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
        body: Column(
<<<<<<< HEAD
      children: [const Text("Sign Up"), const TextField(), TextFormField()],
=======
      children: [Text("Sign Up"), TextField(), TextFormField()],
>>>>>>> cf0dcca4301e7d69253f3d0714de3e1bf2208032
    ));
=======
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement your sign-up logic here
                // For simplicity, navigate to the home screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomeScreen(username: _usernameController.text)),
                );
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the sign-in page
              },
              child: const Text('Already have an account? Sign In'),
            ),
          ],
        ),
      ),
    );
>>>>>>> login-Alabado-Carbonell
  }
}
