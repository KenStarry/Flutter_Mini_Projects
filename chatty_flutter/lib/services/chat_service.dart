import 'package:chatty_flutter/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //  SEND MESSAGE
  Future<void> sendMessage(
      {required String receiverID, required String message}) async {
    //  get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp currentTimestamp = Timestamp.now();

    //  create a new message
    final msg = Message(senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: receiverID,
        message: message,
        timestamp: currentTimestamp);

    //  construct chat room id from currentUserId and receiver id to ensure uniqueness
    List<String> ids = [currentUserId, receiverID];
    ids.sort();

    String chatRoomId = ids.join("_");

    //  add new message to database
    await _firestore.collection('chat_rooms').doc(chatRoomId).collection('messages').add(msg.toMap());
  }

//  GET MESSAGES
}