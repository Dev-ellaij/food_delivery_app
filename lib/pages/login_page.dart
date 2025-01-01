import 'package:flutter/material.dart';
import 'package:food_delivery_app/componets/my_button.dart';
import 'package:food_delivery_app/componets/my_textfield.dart';
import 'package:food_delivery_app/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final VoidCallback
      onTap; // Constructor parameter to handle "Register now" tap

  // Constructor
  LoginPage({super.key, required this.onTap});

  // Login method
  void login(BuildContext context) {
    /*
    Fill out authentication logic here
    */
    // Navigate to home page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Icon(
                Icons.lock_open_rounded,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),

              const SizedBox(height: 25),

              // Message, app slogan
              Text(
                "Food Delivery App",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),

              const SizedBox(height: 25),

              // Email textfield
              MyTextfield(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // Password textfield
              MyTextfield(
                controller: passwordController,
                hintText: "Password",
                obscureText: true, // So that we would hide the characters
              ),

              const SizedBox(height: 10),

              // Sign in button
              MyButton(
                text: "Sign In",
                onTap: () => login(context), // Call login with context
              ),

              const SizedBox(height: 25),

              // Not a member? Register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: onTap, // Corrected onTap function call
                    child: Text(
                      "Register now",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
