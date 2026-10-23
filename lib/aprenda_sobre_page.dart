import 'package:app_todosporum/app_bottom_nav.dart';
import 'package:app_todosporum/forum_page.dart';
import 'package:app_todosporum/home_page.dart';
import 'package:flutter/material.dart';

class AprendaSobrePage extends StatefulWidget {
  const AprendaSobrePage({super.key});

  @override
  State<AprendaSobrePage> createState() => _AprendaSobrePageState();
}

class _AprendaSobrePageState extends State<AprendaSobrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF3F5),
      body: const Center(
        child: Icon(Icons.menu_book, size: 96, color: Color(0xFFF28A2F)),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
            );
          }
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ForumPage()),
            );
          }
          if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const UserAreaPage()),
            );
          }
        },
      ),
    );
  }
}
