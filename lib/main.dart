import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart'; // Tambahkan ini
import 'package:qr_app/ui/home_screen.dart';
import 'package:qr_app/ui/qr_generator_screen.dart';
import 'package:qr_app/ui/qr_scanner_screen.dart';
import 'package:qr_app/ui/splash_screen.dart';

void main() {
  runApp(DevicePreview(
    enabled: true, 
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true, // Wajib untuk Device Preview
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Manrope',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      initialRoute: '/',  
      routes: {
        '/': (context) => const SplashScreen(),  
        '/home': (context) => const HomeScreen(),
        '/create': (context) => const QrGeneratorScreen(),
        '/scan': (context) => const QrScannerScreen(),
      },
      locale: DevicePreview.locale(context), 
      builder: DevicePreview.appBuilder, 
    );
  }
}
