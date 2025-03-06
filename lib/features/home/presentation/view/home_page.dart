import 'package:flutter/material.dart';
import 'feed_page.dart';
import 'friends_page.dart';
import '../../../conversation/presentation/view/chat_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [FeedPage(), FriendsPage(), ChatPage(), ProfilePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient background for the body
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people, size: 28),
            label: "Friends",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, size: 28),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 28),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
