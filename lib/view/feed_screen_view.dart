import 'package:flutter/material.dart';

class FeedScreenView extends StatelessWidget {
  const FeedScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Social media page")])
        ],
      ),
    );
  }
}
