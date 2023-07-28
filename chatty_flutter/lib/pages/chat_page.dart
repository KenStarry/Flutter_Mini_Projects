import 'package:chatty_flutter/components/my_text_field.dart';
import 'package:chatty_flutter/services/chat_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserID;
  final String receiverUserEmail;

  const ChatPage(
      {super.key,
      required this.receiverUserID,
      required this.receiverUserEmail});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          receiverID: widget.receiverUserID, message: _messageController.text);

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverUserEmail),
        centerTitle: true,
      ),
      body: ,
    );
  }

  //  build message list

  //  build message item

  //  build message input
  Widget _buildMessageInput() => Row(
        children: [
          //  text field
          Expanded(
              child: MyTextField(
                  controller: _messageController,
                  hintText: "Enter message",
                  obscureText: false)),

          //  send button
          IconButton(onPressed: (){}, icon: const Icon(Icons.send_rounded))
        ],
      );
}
