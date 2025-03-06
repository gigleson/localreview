import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:localreview/features/home/presentation/view/comment_page.dart';
import 'package:localreview/features/post/presentation/view/CreatePostScreen.dart';


class Post {
  final String username;
  final String userProfileImage;
  final String caption;
  int likes;
  bool isLiked; // New field for like status
  final double rating;
  final String imageUrl;

  Post({
    required this.username,
    required this.userProfileImage,
    required this.caption,
    required this.likes,
    required this.isLiked,
    required this.rating,
    required this.imageUrl,
  });
}

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  // Sample posts list
  final List<Post> posts = [
     Post(
      username: "Kaushal",
      userProfileImage: "https://res.cloudinary.com/dgxf8ul4p/image/upload/v1740890905/vwxbsoezapx2sgn6g6ai.jpg",//1

      caption: "best burger",
      likes: 0,
      isLiked: false,
      rating: 5,
      imageUrl:
          "https://res.cloudinary.com/dgxf8ul4p/image/upload/v1741264958/fgnv91xzkte9paes4ihq.jpg",
    ),
    Post(
      username: "Ronaldo",
      userProfileImage: "https://res.cloudinary.com/dgxf8ul4p/image/upload/v1741264552/jnbcilnwre5zphv1hdgu.jpg",
      caption: "nice momo",
      likes: 1,
      isLiked: false, // Default to unliked
      rating: 4,
      imageUrl:
          "https://res.cloudinary.com/dgxf8ul4p/image/upload/v1740898017/xcstlibaxuhzsjcxtjo5.jpg",
    ),
    Post(
      username: "Ronaldo",
      userProfileImage: "https://res.cloudinary.com/dgxf8ul4p/image/upload/v1741264552/jnbcilnwre5zphv1hdgu.jpg",
      caption: "Its good momo u should try",
      likes: 1,
      isLiked: false, // Default to unliked
      rating: 3,
      imageUrl:
          "https://res.cloudinary.com/dgxf8ul4p/image/upload/v1740890969/f6hg8hlxyg49rdflr0ey.jpg",
    ),
   
  ];

  void _toggleLike(int index) {
    setState(() {
      if (posts[index].isLiked) {
        posts[index].likes--;
      } else {
        posts[index].likes++;
      }
      posts[index].isLiked = !posts[index].isLiked;
    });
  }

  void _openComments(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CommentPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Feed")),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Section (Username + Profile Picture)
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(post.userProfileImage),
                  ),
                  title: Text(post.username),
                ),
                // Image
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(post.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Caption
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(post.caption),
                ),
                // Rating Display
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      const Text(
                        "Rating: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      RatingBarIndicator(
                        rating: post.rating,
                        itemBuilder: (context, _) =>
                            const Icon(Icons.star, color: Colors.yellow),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                ),
                // Buttons for Like & Comment
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          post.isLiked ? Icons.favorite : Icons.favorite_border,
                          color: post.isLiked ? Colors.red : Colors.grey,
                        ),
                        onPressed: () => _toggleLike(index),
                      ),
                      Text("${post.likes} Likes"),
                      const SizedBox(width: 20),
                      IconButton(
                        icon: const Icon(Icons.comment, color: Colors.blue),
                        onPressed: () => _openComments(index),
                      ),
                      const Text("Comment"), // Removed count from here
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreatePostScreen()),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
