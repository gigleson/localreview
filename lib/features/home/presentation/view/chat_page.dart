import 'package:flutter/material.dart';
import 'package:localreview/features/home/presentation/view/message_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of users with profile pictures
    final List<Map<String, String>> users = List.generate(
      1,
      (index) => {
        "name": "Ronaldo",
        "message": "",
        "profileImage": "https://res.cloudinary.com/dgxf8ul4p/image/upload/v1741264552/jnbcilnwre5zphv1hdgu.jpg",
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Chats")),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          return ListTile(
            leading: GestureDetector(
              onTap: () {
                // Navigate to MessagePage when profile picture is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessagePage(
                      userName: user["name"]!,
                      profileImage: user["profileImage"]!,
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(user["profileImage"]!),
              ),
            ),
            title: Text(user["name"]!),
            subtitle: Text(user["message"]!),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to MessagePage when tapping the list item
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessagePage(
                    userName: user["name"]!,
                    profileImage: user["profileImage"]!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Message Page (Chat screen)
