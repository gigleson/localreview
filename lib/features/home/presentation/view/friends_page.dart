import 'package:flutter/material.dart';
import 'package:localreview/features/home/presentation/view/user_profile_page.dart';

class Friend {
  final String name;
  final String status;
  final String imageUrl;

  Friend({required this.name, required this.status, required this.imageUrl});
}

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of friends with images (this could come from an API or database)
    final List<Friend> friends = List.generate(
      1,
      (index) => Friend(
        name: "Ronaldo",
        status: "Suggested Friend",
        imageUrl: "https://res.cloudinary.com/dgxf8ul4p/image/upload/v1741264552/jnbcilnwre5zphv1hdgu.jpg", // Sample image URL
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Friends")),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          final friend = friends[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(friend.imageUrl),
            ),
            title: Text(friend.name),
            subtitle: Text(friend.status),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                // Navigate to the UserProfilePage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfilePage(), // Navigate to UserProfilePage
                  ),
                );
              },
              child: const Text("Visit Profile", style: TextStyle(color: Colors.white)),
            ),
          );
        },
      ),
    );
  }
}