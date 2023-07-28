import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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

                const SizedBox(height: 16),

                MyTextField(
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                    obscureText: true),

                const SizedBox(height: 48),

                MyButton(text: "Sign In", onTap: () {}),

                const SizedBox(height: 48),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member? "),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Register now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
