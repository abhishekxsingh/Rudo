import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final String displayName;

  const WelcomePage({
    Key? key,
    required this.displayName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/image/logo.png',
                height: 70,
              ),
              const SizedBox(height: 24),

              // Welcome Text
              Text(
                'Welcome, $displayName to the Rudo App, Thank you for signing up!',
                style: const TextStyle(
                  fontSize: 25,
                  fontFamily: 'Be Vietnam Pro',
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
