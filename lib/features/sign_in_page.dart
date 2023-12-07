import 'package:cc206_todo_list_/features/homescreen.dart';
import 'package:cc206_todo_list_/features/sign_up_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Use a Stack to overlay the logo on top of other widgets
            Stack(
              alignment: Alignment.topCenter,
              children: [
                // Your logo widget goes here
                Image.asset(
                  'images/header.png', // Replace with the path to your logo image
                  height: 100,
                  width: 100,
                ),
                // Your form widgets go here
                Column(
                  children: [
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
                        // Implement your sign-in logic here
                        // For simplicity, navigate to the home screen
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                  username: _usernameController.text)),
                        );
                      },
                      child: const Text('Sign In'),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: const Text('Don\'t have an account? Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
