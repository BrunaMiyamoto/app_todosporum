import 'package:app_todosporum/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos Por Um',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFEAF3F5),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0A6D8E),
          primary: const Color(0xFF0A6D8E),
          secondary: const Color(0xFFF28A2F),
          surface: const Color(0xFFEAF3F5),
        ),
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: const Color(0xFF0F2C3A),
          displayColor: const Color(0xFF0F2C3A),
          fontFamily: 'Roboto',
        ),
      ),
      home: HomeScreen(),
    );
  }
}

typedef TodosPorUmApp = MyApp;
