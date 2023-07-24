import 'package:brew_crew_firebase_app/models/user.dart';
import 'package:brew_crew_firebase_app/screens/authentication/authentication_screen.dart';
import 'package:brew_crew_firebase_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WrapperWidget extends StatelessWidget {
  const WrapperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel>(context);
    print(user);

    //  depending on whether the user is signed in or not, return Home or Auth
    return AuthenticationScreen();
  }
}
