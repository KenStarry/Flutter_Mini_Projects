import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {

  final String receiverUserID;

  const ChatPage({super.key,required this.receiverUserID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}