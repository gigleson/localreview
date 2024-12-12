import 'package:flutter/material.dart';
import 'package:localreview/view/signup_screen_view.dart';


class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
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
                    'Welcome Back!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Log in to your account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 40),

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

                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle Login
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.blue.shade700,
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Sign-Up Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white70),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to Sign-Up Screen
                                    Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreenView()),
                          );
                        },
                        child: const Text(
                          'Sign Up',
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