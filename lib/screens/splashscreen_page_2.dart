import 'package:flutter/material.dart';

class SplashScreenPage2 extends StatelessWidget {
  const SplashScreenPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF08090A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/image/logo.png'),
              ],
            ),
            const SizedBox(height: 20),
            // Tagline in a pill-shaped container
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade700),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Text(
                'RuDo makes investing effortless',
                style: TextStyle(
                  fontFamily: 'BeVietnamPro',
                  color: Color(0xFFD6D3C2),
                  fontSize: 16,
                  shadows: [
                    Shadow(
                      color: Color(0x245C5C5C),
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Example of how to use this in your main.dart:
/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RuDo Investment App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'BeVietnamPro',
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
*/