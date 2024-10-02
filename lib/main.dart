import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth_screen.dart';
import 'chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Chattogram());
}

class Chattogram extends StatelessWidget {
  const Chattogram({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chattogram',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const AuthScreen(),
      routes: {
        ChatScreen.routeName: (ctx) => const ChatScreen(),
      },
    );
  }
}
