import 'package:chatty_flutter/components/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //  logo
                Icon(
                  Icons.message_rounded,
                  size: 80,
                ),

                const SizedBox(height: 48),

                Text("Welcome back you've been missed",
                    style: TextStyle(fontSize: 16)),

                const SizedBox(height: 24),

                MyTextField(
                    controller: emailController,
                    hintText: "Email Address",
                    obscureText: false),

                const SizedBox(height: 16),

                MyTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
