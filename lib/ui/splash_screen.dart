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
      backgroundColor: const Color(0xFF553FB8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo atau animasi
            Image.asset(
              'assets/images/splash.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            // Teks Splash
            const Text(
              'ScannerCode',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
