import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  final String? message;
  final String? imageUrl;
  final String? audioUrl;
  final String? videoUrl;

  const MessageScreen({super.key, 
    this.message,
    this.imageUrl,
    this.audioUrl,
    this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      return Image.network(imageUrl!);
    } else if (audioUrl != null) {
      return ListTile(
        leading: const Icon(Icons.play_arrow),
        title: const Text("Audio message"),
        onTap: () {
          // Play audio
        },
      );
    } else if (videoUrl != null) {
      return ListTile(
        leading: const Icon(Icons.play_arrow),
        title: const Text("Video message"),
        onTap: () {
          // Play video
        },
      );
    } else {
      return ListTile(
        title: Text(message ?? ''),
      );
    }
  }
}
