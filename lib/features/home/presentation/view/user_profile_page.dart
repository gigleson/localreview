import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final String profileImageUrl = "https://res.cloudinary.com/dgxf8ul4p/image/upload/v1741264552/jnbcilnwre5zphv1hdgu.jpg";
  final String username = "Ronaldo";
  final String bio = "Hi i am ronaldo";
  final int postCount = 2;
  int followerCount = 0;
  final int followingCount = 0;
  bool isFollowing = false; // Follow status

  final List<String> postImageUrls = [
    "https://res.cloudinary.com/dgxf8ul4p/image/upload/v1740898017/xcstlibaxuhzsjcxtjo5.jpg",
    "https://res.cloudinary.com/dgxf8ul4p/image/upload/v1740890969/f6hg8hlxyg49rdflr0ey.jpg",
    // "https://picsum.photos/200/200?random=9",
    // "https://picsum.photos/200/200?random=10",
    // "https://picsum.photos/200/200?random=11",
    // "https://picsum.photos/200/200?random=12",
  ];

  void _toggleFollow() {
    setState(() {
      if (isFollowing) {
        followerCount--;
      } else {
        followerCount++;
      }
      isFollowing = !isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Profile Header Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(profileImageUrl),
                  ),
                  const SizedBox(width: 20),
                  // Profile Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          bio,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        // Stats Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildStat("$postCount", "Posts"),
                            _buildStat("$followerCount", "Followers"),
                            _buildStat("$followingCount", "Following"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Follow/Unfollow Button
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _toggleFollow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isFollowing ? Colors.grey[300] : Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    isFollowing ? "Unfollow" : "Follow",
                    style: TextStyle(
                      fontSize: 16,
                      color: isFollowing ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),

              // Post Gallery
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: postImageUrls.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print('Post ${index + 1} tapped');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        postImageUrls[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
