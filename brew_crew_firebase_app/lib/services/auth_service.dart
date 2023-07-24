import 'package:brew_crew_firebase_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //  create user model base on firebase user
  UserModel? _userFromFirebaseUser(User? user) =>
      user != null ? UserModel(uid: user.uid) : null;

  //  detect an auth change using Stream - live changes in a stream
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map((user) => _userFromFirebaseUser(user));
  }

  //  sign in anonymously
  Future signInAnonymously() async {
    try {
      //  wait until the request is complete
      UserCredential result = await _auth.signInAnonymously();

      //  get the logged in user
      User? currentUser = result.user;
      return _userFromFirebaseUser(currentUser);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

//  sign in with email and password

//  register with email and password

//  logout
}
