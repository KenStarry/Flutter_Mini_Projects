import 'package:chatty_flutter/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onLoginTap;

  const RegisterPage({super.key, required this.onLoginTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp() async {
    if (passwordController.text == confirmPasswordController.text) {
      final authService = Provider.of<AuthService>(context, listen: false);

      try {
        await authService.signUpWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Passwords don't match")));

      return;
    }
  }

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
                const Icon(
                  Icons.message_rounded,
                  size: 80,
                ),

                const SizedBox(height: 48),

                const Text("Let's create an account for you",
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

                MyButton(text: "Sign Up", onTap: signUp),

                const SizedBox(height: 48),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already a member? "),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onLoginTap,
                      child: const Text(
                        "Login now",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
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
