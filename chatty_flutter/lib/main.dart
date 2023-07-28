import 'package:chatty_flutter/pages/login_page.dart';
import 'package:chatty_flutter/pages/register_page.dart';
import 'package:chatty_flutter/services/auth/login_or_register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
    );
  }
}

