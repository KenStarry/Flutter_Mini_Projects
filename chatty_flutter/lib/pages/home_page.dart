import 'package:chatty_flutter/pages/chat_page.dart';
import 'package:chatty_flutter/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //  instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signOut() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: Text("Welcome Home"),
    );
  }

  //  build a list of users except for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('error');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('loading...');
          }

          return
        });
  }

  Widget _buildUserItem(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;

    //  display user if they aren't the user currently logged in
    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
        title: data['email'],
        onTap: () {
          //  pass the clicked UId to the chat page
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => ChatPage(receiverUserID: data['uid'])));
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
