import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'message_screen.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '/chat-screen';

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chattogram'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('chats').orderBy('createdAt', descending: true).snapshots(),
              builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
                if (chatSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final chatDocs = chatSnapshot.data?.docs ?? [];
                return ListView.builder(
                  reverse: true,
                  itemCount: chatDocs.length,
                  itemBuilder: (ctx, index) => MessageScreen(
                    message: chatDocs[index]['text'],
                    imageUrl: chatDocs[index]['imageUrl'],
                    audioUrl: chatDocs[index]['audioUrl'],
                    videoUrl: chatDocs[index]['videoUrl'],
                  ),
                );
              },
            ),
          ),
          // Add a widget for sending messages (text, photo, video, audio)
        ],
      ),
    );
  }
}
