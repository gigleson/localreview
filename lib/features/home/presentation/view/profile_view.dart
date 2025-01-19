import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile picture with shadow effect
            CircleAvatar(
              radius: 80,
              backgroundImage: const AssetImage('assets/images/logo.png'),
              backgroundColor: Colors.grey[200],
            ),
            const SizedBox(height: 20),
            // User name in large bold text
            const Text(
              'John Doe', // Replace with actual user data
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),

            // Action buttons in a card-like design
            _buildActionButton(
              label: 'View Profile',
              color: Colors.deepPurple,
              onPressed: () {
                // Navigate to View Profile page
              },
            ),
            const SizedBox(height: 16),
            _buildActionButton(
              label: 'Settings',
              color: Colors.deepPurple,
              onPressed: () {
                // Navigate to Settings page
              },
            ),
            const SizedBox(height: 16),
            _buildActionButton(
              label: 'Favorites',
              color: Colors.deepPurple,
              onPressed: () {
                // Navigate to Favorites page
              },
            ),
            const SizedBox(height: 16),
            _buildActionButton(
              label: 'Logout',
              color: Colors.redAccent, // Logout with a distinct color
              onPressed: () {
                // Implement logout functionality
              },
            ),
          ],
        ),
      ),
    );
  }

  // Custom method to create action buttons with card-like appearance
  Widget _buildActionButton({
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
