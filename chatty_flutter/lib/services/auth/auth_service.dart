import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //  sign in
  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential;

    } on FirebaseAuthException catch (error) {
      throw Exception(error.code);
    }
  }

//  sign out
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
