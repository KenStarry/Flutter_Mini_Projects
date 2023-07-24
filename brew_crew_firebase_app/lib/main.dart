import 'package:brew_crew_firebase_app/models/user.dart';
import 'package:brew_crew_firebase_app/screens/wrapper_screen.dart';
import 'package:brew_crew_firebase_app/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  //  ensures we have access to the backend part of our program
  WidgetsFlutterBinding.ensureInitialized();

  //  initializing Firebase
  Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        title: 'Brew Crew',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: WrapperWidget(),
      ),
    );
  }
}
