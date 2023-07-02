import 'package:flutter/material.dart';

import '../../models/chat_message.dart';


class ChatMessagesScreen extends StatelessWidget {
  const ChatMessagesScreen({Key? key}) : super(key: key);

  static const List<ChatMessage> _chatMessage = <ChatMessage>[
    ChatMessage(content: 'Message #1', isOwner: false),
    ChatMessage(content: 'Lorem Ipsum is simply dummy text of the printing ', isOwner: false),
    ChatMessage(content: 'Lorem Ipsum is simply dummy text of the printing ', isOwner: true),
    ChatMessage(content: 'Message #1', isOwner: false),
    ChatMessage(content: 'Message #1', isOwner: true),
    ChatMessage(content: 'Lorem Ipsum is simply dummy text of the printing ', isOwner: false),
    ChatMessage(content: 'Lorem Ipsum is simply dummy text of the printing ', isOwner: true),
    ChatMessage(content: 'Message #1', isOwner: false),
    ChatMessage(content: 'Message #1', isOwner: false),
    ChatMessage(content: 'Lorem Ipsum is simply dummy text of the printing ', isOwner: false),
    ChatMessage(content: 'Lorem Ipsum is simply dummy text of the printing ', isOwner: true),
    ChatMessage(content: 'Message #1', isOwner: false),
    ChatMessage(content: 'Message #1', isOwner: true),
    ChatMessage(content: 'Lorem Ipsum is simply dummy text of the printing ', isOwner: false),
    ChatMessage(content: 'Lorem Ipsum is simply dummy text of the printing ', isOwner: true),
    ChatMessage(content: 'Message #1', isOwner: false),
    ChatMessage(content: 'Message #1', isOwner: true),
    ChatMessage(content: 'Lorem Ipsum is simply dummy text of the printing ', isOwner: false),
    ChatMessage(content: 'Lorem Ipsum is simply dummy text of the printing ', isOwner: true),
    ChatMessage(content: 'Message #1', isOwner: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: _chatMessage.map((ChatMessage chatMessage) {
                    return Align(
                      alignment: chatMessage.isOwner? AlignmentDirectional.topEnd:AlignmentDirectional.topStart,
                      child: Container(
                        margin: EdgeInsetsDirectional.only(bottom: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: chatMessage.isOwner? Colors.pink.shade100: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('Message Content'),
                      ),
                    );
                  }).toList(),
     ),
              ),
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow:const [
                BoxShadow(
                offset: Offset(0, -3),
                color: Colors.black26,
                blurRadius: 3,
              ),
              ],
            ),
           child: Row(
             children: [
               Expanded(
                   child: TextField(
                     decoration: InputDecoration(
                       hintText: 'Enter massage here..'
                     ),
                   ),
               ),
               IconButton(
                 onPressed: (){},
                 icon: Icon(Icons.send),
               ),
             ],
           ),
          ),
        ],
      ),
    );
  }
}
