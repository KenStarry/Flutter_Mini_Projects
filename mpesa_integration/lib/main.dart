import 'package:flutter/material.dart';
import 'package:mpesa_integration/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/*
CREDENTIALS
VdALXD7pliAbeaoNmClZLsOpWmphvtQKmD9DgufSWbngV2l63g7Hf0ATiJ5e7NmSKX+ZyUxdmF21yTcSARx+EpQlipGMvUfPIc+/lmgtM50hOdG6JtZ6p08seSmZYdMtF+uMocEowRIKCGOdL6JvXFWp9fmwIsiL0hxAz8UFqkzkhWh2BsO/TpfEwEm6WBcoJxld+lpIy//r9p8howlLT8o2RlhPzuEzcS4ny046QvwhBktOXWrnz3zVjBhki2zy8FveO0F0miJYTyh18fGZEDvkjBLbk13l6b1VVHBXriYQNzRa2IA3d10AIJUmt73prfCtpOKaxLDBazn8z3tcSw==
* */
