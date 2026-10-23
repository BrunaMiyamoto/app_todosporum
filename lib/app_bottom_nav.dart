import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF0A6D8E),
          unselectedItemColor: const Color(0xFF7A8B96),
          elevation: 0,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.forum), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
        ),
      ),
    );
  }
}

class UserAreaPage extends StatelessWidget {
  const UserAreaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEAF3F5),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFF0A6D8E), Color(0xFF1FA2C7)],
                  ),
                ),
                child: const Icon(Icons.person, size: 58, color: Colors.white),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.favorite, color: Color(0xFFF28A2F), size: 28),
                  SizedBox(width: 12),
                  Icon(Icons.notifications, color: Color(0xFF0A6D8E), size: 28),
                  SizedBox(width: 12),
                  Icon(Icons.settings, color: Color(0xFF0A6D8E), size: 28),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
