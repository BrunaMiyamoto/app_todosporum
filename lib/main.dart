import 'package:app_todosporum/home_page.dart';
import 'package:flutter/material.dart';

// ============================================================
// ARQUIVO PRINCIPAL DA APLICAÇÃO
// ============================================================
// Este é o ponto de entrada do app. Aqui a aplicação é iniciada e
// também são definidos o tema visual global e a primeira tela que
// aparecerá na abertura do app.
//
// Se você quiser criar uma nova tela, normalmente ela é chamada aqui
// ou navegada a partir de outra tela. O importante é manter o fluxo
// de navegação organizado para não ficar difícil de entender.
// ============================================================
void main() {
  runApp(const MyApp());
}

// ============================================================
// BLOCO 2: CONFIGURAÇÃO GLOBAL DO APP
// ============================================================
// Este widget é o "container" principal da aplicação.
// Ele define as configurações visuais gerais, como:
// - cores do tema
// - fontes
// - fundo padrão das telas
// - tela inicial que será exibida ao abrir o app
//
// Se você quiser alterar a cor principal, a aparência do app em geral,
// ou trocar a tela inicial, este é o lugar certo para isso.
// ============================================================
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
