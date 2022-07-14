import 'package:flutter/material.dart';

import '../backend/backend.dart';
import '../widget/chat_list.dart';
import '../widget/shimmer_effect.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: FutureBuilder(
          future: Backend.getChatData(),
          builder: (context, AsyncSnapshot<List<dynamic>> chatDataSnapshot) {
            if (chatDataSnapshot.connectionState == ConnectionState.waiting) {
              return const ShimmerEffect();
            } else {
              List chatData = chatDataSnapshot.data!;
              return ChatList(chatData: chatData);
            }
          }),
    );
  }
}
