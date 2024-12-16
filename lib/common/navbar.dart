import 'package:flutter/material.dart';


class BottomNavationView extends StatefulWidget {
  const BottomNavationView({super.key});

  @override
  State<BottomNavationView> createState() => _BottomNavationViewState();
}

class _BottomNavationViewState extends State<BottomNavationView> {
  int _index = 0;
  List<Widget> screens = [
    // HomeView(),
    // CartView(),
    // ProfileView(),
    // AboutView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("bottom navation"),
      ),
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: "cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_off_outlined),
            label: "profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc_outlined),
            label: "About",
          ),
        ],
      ),
    );
  }
}
