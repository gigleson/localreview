import 'package:flutter/material.dart';
import 'package:localreview/view/feed_screen_view.dart';
import 'package:localreview/view/home_screen_view.dart';
import 'package:localreview/view/profile_view.dart';

class BottomNavationView extends StatefulWidget {
  const BottomNavationView({super.key});

  @override
  State<BottomNavationView> createState() => _BottomNavationViewState();
}

class _BottomNavationViewState extends State<BottomNavationView> {
  int _index = 0;
  List<Widget> screens = [
    const HomeScreenView(),
    const FeedScreenView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Review"),
        backgroundColor: Colors.green[200],
      ),
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[200],
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
