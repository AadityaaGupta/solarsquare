import 'package:flutter/material.dart';
import 'package:solarsquare/splash_screen.dart';

void main() {
  runApp(const SolarSquareApp());
}

class SolarSquareApp extends StatelessWidget {
  const SolarSquareApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SolarSquare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF101d8b), // Green  #101d8b
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF101d8b),
          primary: const Color(0xFF101d8b),
          secondary: const Color(0xFFFFA726), // Orange accent
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF101d8b),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF101d8b),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF101d8b), width: 2),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}