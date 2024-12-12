import 'package:flutter/material.dart';
import 'package:localreview/view/login_screen_view.dart';

class SignupScreenView extends StatelessWidget {
  const SignupScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0072FF), Color(0xFF00C6FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // App Logo
                  Image.asset(
                    'assets/images/logo.png',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 30),

                  // Welcome Text
                  const Text(
                    'Create Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Sign up to get started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Full Name TextField
                  _buildTextField(
                    controller: nameController,
                    hintText: 'Full Name',
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 20),

                  // Email TextField
                  _buildTextField(
                    controller: emailController,
                    hintText: 'Email',
                    icon: Icons.email,
                  ),
                  const SizedBox(height: 20),

                  // Password TextField
                  _buildTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),

                  // Confirm Password TextField
                  _buildTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    icon: Icons.lock_outline,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),

                  // Sign-Up Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle Sign-Up
                      final name = nameController.text.trim();
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();
                      final confirmPassword =
                          confirmPasswordController.text.trim();

                      if (name.isEmpty ||
                          email.isEmpty ||
                          password.isEmpty ||
                          confirmPassword.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill in all fields.'),
                          ),
                        );
                        return;
                      }

                      if (password != confirmPassword) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Passwords do not match.'),
                          ),
                        );
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Sign-Up Successful!')),
                      );

                      // Add your sign-up logic here
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.blue.shade700,
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Already have an account? Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.white70),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to Login Screen
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreenView()),
                          );
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // A helper function to build styled TextFields
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white24,
        prefixIcon: Icon(icon, color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
