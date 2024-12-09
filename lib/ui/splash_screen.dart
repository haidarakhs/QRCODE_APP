import 'dart:async'; // Impor Timer
import 'package:flutter/material.dart';

import 'home_screen.dart'; // Pastikan untuk mengimpor HomeScreen atau rute yang sesuai

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

   
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo atau animasi
            Image.asset(
              'assets/images/logo scan.png',
              width: 90,
              height: 90,
            ),
            const SizedBox(height: 20),
            // Teks Splash
            const Text(
              'ScannerCode',
              style: TextStyle(
                color: Color.fromARGB(255, 16, 100, 160),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
