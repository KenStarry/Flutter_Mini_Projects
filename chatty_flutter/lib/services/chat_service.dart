import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //  SEND MESSAGE
  Future<void> sendMessage({required String receiverID, required String message}) {

    //  get current user info
    //  create a new message
    //  construct chat room id from currentUserId and receiver id to ensure uniqueness
    //  add new message to database
  }

  //  GET MESSAGES
}