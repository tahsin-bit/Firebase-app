import 'package:flutter/material.dart';
import 'package:roktalap/screens/messaging/chat_screen.dart';

class ChatHistoryPage extends StatelessWidget {
  const ChatHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _buildChatCard(
            context: context,
            isUnread: index % 3 == 0, // Example unread logic
          );
        },
      ),
    );
  }

  Widget _buildChatCard({required BuildContext context, required bool isUnread}) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 30,
        // backgroundImage: NetworkImage('...'),
      ),
      title: const Text('User Name'),
      subtitle: Text(
        'Last message...',
        style: TextStyle(
          fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('10:30 AM'),
          SizedBox(height: 4),
          CircleAvatar(
            radius: 4,
            backgroundColor: Colors.green, // Online indicator
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ChatScreen(),
          ),
        );
      },
    );
  }
}
