// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_todosporum/main.dart';

void main() {
  testWidgets(
    'App loads the home screen content with a fixed bottom navigation bar',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('ENVIE SUA IDEIA JÁ'), findsOneWidget);
      expect(find.text('DESTAQUES DA COMUNIDADE'), findsOneWidget);
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(find.byIcon(Icons.home), findsWidgets);
      expect(find.byIcon(Icons.forum), findsWidgets);
      expect(find.byIcon(Icons.menu_book), findsWidgets);
      expect(find.byIcon(Icons.person), findsWidgets);
    },
  );
}
