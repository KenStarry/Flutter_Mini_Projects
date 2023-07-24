import 'package:brew_crew_firebase_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  late final AuthService _authService;

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade400,
        title: Text("Sign In"),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 24
        ),
        child: MaterialButton(
          onPressed: () async {
            var result = await _authService.signInAnonymously();

            if (result == null) {
              print("Error signing in");
            } else {
              print("Signed in : $result");
            }

          },
          child: const Text("Sign In Anonymously"),
        ),
      ),
    );
  }
}
