import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:localreview/features/auth/presentation/view/login/login_screen_view.dart';
import 'package:localreview/features/home/presentation/view/edit_profile.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ShakeDetector {
  final Function onShake;
  final double shakeThreshold;

  StreamSubscription<AccelerometerEvent>? _streamSubscription;
  DateTime? _lastShake;

  ShakeDetector({
    required this.onShake,
    this.shakeThreshold = 3.0,
  });

  void startListening() {
    _streamSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      double x = event.x;
      double y = event.y;
      double z = event.z;

      // Calculate acceleration vector magnitude
      double acceleration = sqrt(x * x + y * y + z * z) - 9.8;

      DateTime now = DateTime.now();

      if (_lastShake == null ||
          now.difference(_lastShake!) > Duration(milliseconds: 1000)) {
        if (acceleration > shakeThreshold) {
          _lastShake = now;
          onShake();
        }
      }
    });
  }

  void stopListening() {
    _streamSubscription?.cancel();
    _streamSubscription = null;
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // final String profileImageUrl = "https://randomuser.me/api/portraits/men/1.jpg";
  // final String bio = "Bio .....";
  final String username = "Kaushal";
  final String profileImageUrl = "https://res.cloudinary.com/dgxf8ul4p/image/upload/v1740890905/vwxbsoezapx2sgn6g6ai.jpg";
  final String bio = "Hi i am kaushal";
  final int postCount = 0;
  final int followerCount = 0;
  final int followingCount = 0;

  final List<String> postImageUrls = [
    "https://res.cloudinary.com/dgxf8ul4p/image/upload/v1741264958/fgnv91xzkte9paes4ihq.jpg",
    // "https://picsum.photos/200/200?random=2",
    // "https://picsum.photos/200/200?random=3",
    // "https://picsum.photos/200/200?random=4",
    // "https://picsum.photos/200/200?random=5",
    // "https://picsum.photos/200/200?random=6",
  ];

  ShakeDetector? _shakeDetector;

  @override
  void initState() {
    super.initState();
    // Initialize ShakeDetector and start listening for shakes
    _shakeDetector = ShakeDetector(onShake: _logOut);
    _shakeDetector?.startListening();
  }

  @override
  void dispose() {
    // Stop listening for shakes when the page is disposed
    _shakeDetector?.stopListening();
    super.dispose();
  }

  void _logOut() {
    // Handle logout on shake detection
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreenView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
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
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(profileImageUrl),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(bio, style: const TextStyle(fontSize: 14)),
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

              // Buttons Section
              const SizedBox(height: 20),
              _buildButton(
                text: "Edit Profile",
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EditProfilePage()),
                  );
                },
              ),
              const SizedBox(height: 10),
              _buildButton(
                text: "Logout",
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreenView()),
                  );
                },
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

  Widget _buildButton({
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
        ),
      ),
    );
  }
}
