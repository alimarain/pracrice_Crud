import 'package:flutter/material.dart';
import 'package:main/post_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final emailController = TextEditingController();
  final passController = TextEditingController();

  final String validEmail = "alimarain55@gmail.com";
  final String validPassword = "12345";

  void checkLogin(BuildContext context) {
    if (emailController.text == validEmail &&
        passController.text == validPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PostView()),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Login Failed"),
          content: const Text("Wrong email or password."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: const Text("Login", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/2023_Facebook_icon.svg/2048px-2023_Facebook_icon.svg.png',
                width: 80,
                height: 80,
              ),
              const SizedBox(height: 30),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: passController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => checkLogin(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                ),
                child: const Text("Log In"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Forgot password?",
                    style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}