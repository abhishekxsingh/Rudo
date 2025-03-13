import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rudo/blocs/navigation/navigation_bloc.dart';
import 'package:rudo/blocs/navigation/navigation_event.dart';
import 'package:rudo/screens/loginpage.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF08090A), // New background color
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // RuDo Logo
                Image.asset(
                  'assets/image/tinylogo.png',
                  height: 40,
                  errorBuilder: (context, error, stackTrace) {
                    print('Error loading logo: $error');
                    return Container(
                      height: 40,
                      width: 100,
                      color: Colors.grey.shade800,
                      child: const Center(
                          child: Text('Logo',
                              style: TextStyle(color: Colors.white))),
                    );
                  },
                ),

                const Spacer(flex: 1),

                // Center Image
                Center(
                  child: Image.asset(
                    'assets/image/zero.png',
                    height: 220,
                    errorBuilder: (context, error, stackTrace) {
                      print('Error loading center image: $error');
                      return Container(
                        height: 220,
                        width: 220,
                        color: Colors.grey.shade800,
                        child: const Center(
                            child: Text('Image',
                                style: TextStyle(color: Colors.white))),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Investment with ZERO effort button
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey.shade800),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFD4AF37), // Gold color fill
                            border: Border.all(
                              color: Color(0xFFD4AF37), // Gold color border
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFD4AF37).withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Text(
                            '₹',
                            style: TextStyle(
                              color:
                                  Colors.black, // Black color for rupee symbol
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: [Color(0xFFD6D3C2), Color(0xFFADA785)],
                            ).createShader(bounds);
                          },
                          child: const Text(
                            'Investment with ZERO effort',
                            style: TextStyle(
                              color: Colors.white, // This color acts as a mask
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(flex: 1),

                // Text heading
                const Text(
                  'Investment Made\nEasier With',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [
                        Color(0xFF0A9F83), // Teal color
                        Color(0xFFFFFFFF), // White color
                      ],
                    ).createShader(bounds);
                  },
                  child: const Text(
                    'RuDo',
                    style: TextStyle(
                      color: Colors.white, // This color acts as a mask
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const Spacer(flex: 1),

                // getstarted button
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 24, // Add horizontal padding
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            'Get started',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Icon(Icons.arrow_forward, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // I already have an account
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.read<NavigationBloc>().add(NavigateToLogin());
                    },
                    child: const Text(
                      'I already have an account',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
