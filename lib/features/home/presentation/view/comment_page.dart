import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final TextEditingController _commentController = TextEditingController();

  // Sample comments (You can edit this manually)
  final List<Map<String, String>> _comments = [
    {
      "name": "Ronaldo",
      "comment": "This is amazing!",
      "image":
          "https://res.cloudinary.com/dgxf8ul4p/image/upload/v1741264552/jnbcilnwre5zphv1hdgu.jpg"
    },
    {
      "name": "Kaushal",
      "comment": "i will try it",
      "image": "https://res.cloudinary.com/dgxf8ul4p/image/upload/v1740890905/vwxbsoezapx2sgn6g6ai.jpg"
    },
    // {
    //   "name": "User 3",
    //   "comment": "Loved this content! Keep it up.",
    //   "image": "https://randomuser.me/api/portraits/men/3.jpg"
    // },
  ];

  void _addComment() {
    if (_commentController.text.trim().isEmpty) return;

    setState(() {
      _comments.add({
        "name": "You",
        "comment": _commentController.text,
        "image":
            "https://res.cloudinary.com/dgxf8ul4p/image/upload/v1740890905/vwxbsoezapx2sgn6g6ai.jpg", // Your profile image
      });
    });

    _commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Comments")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                final comment = _comments[index];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(comment["image"]!),
                  ),
                  title: Text(
                    comment["name"]!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(comment["comment"]!),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: "Add a comment...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: _addComment,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
