import 'package:flutter/material.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groups'),
      ),
      body: const Center(
        child: Text('Group management UI here'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Create new group
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
