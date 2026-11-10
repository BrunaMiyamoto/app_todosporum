import 'package:app_todosporum/app_bottom_nav.dart';
import 'package:app_todosporum/aprenda_sobre_page.dart';
import 'package:app_todosporum/contatos_page.dart';
import 'package:app_todosporum/forum_page.dart';
import 'package:app_todosporum/home_page.dart';
import 'package:app_todosporum/sobre_nos_page.dart';
import 'package:flutter/material.dart';

// ============================================================
// PÁGINA DE POLÍTICAS
// ============================================================
// Esta tela é reservada para informações legais e de uso do app, como:
// - termos de uso
// - política de privacidade
// - regras de acesso
// - proteção de dados
//
// Assim como a página de contatos, ela está em estado inicial, então
// o Placeholder indica que o conteúdo ainda não foi montado. Quando
// for criar a tela real, você pode construir blocos de texto, listas e
// botões de navegação dentro deste widget.
// ============================================================
class PoliticasPage extends StatelessWidget {
  const PoliticasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // BLOCO 2.1: Cabeçalho da página
      appBar: AppBar(title: Text("Nossas Políticas"), centerTitle: true),

      // BLOCO 2.2: Menu lateral (drawer) e navegação entre telas
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // BLOCO 2.2.1: Cabeçalho do menu
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF0F3C4E)),
              child: Text(
                "Todos Por Um",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),

            // BLOCO 2.2.2: Item inicial do menu
            ListTile(
              leading: Icon(Icons.home),
              iconColor: Color(0xFFF28A2F),
              title: Text("Inicio", style: TextStyle(color: Color(0xFFF28A2F))),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                );
              },
            ),
            // BLOCO 2.2.3: Navegação para a tela de Fórum
            ListTile(
              leading: Icon(Icons.forum),
              iconColor: Color(0xFFF28A2F),
              title: Text("Fórum", style: TextStyle(color: Color(0xFFF28A2F))),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ForumPage()),
                );
              },
            ),

            // BLOCO 2.2.4: Navegação para a própria página "Sobre Nós"
            ListTile(
              leading: Icon(Icons.assignment_late_outlined),
              iconColor: Color(0xFFF28A2F),
              title: Text(
                "Sobre Nós",
                style: TextStyle(color: Color(0xFFF28A2F)),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SobreNosPage()),
                );
              },
            ),

            // BLOCO 2.2.5: Navegação para a tela "Aprenda sobre"
            ListTile(
              leading: Icon(Icons.menu_book),
              iconColor: Color(0xFFF28A2F),
              title: Text(
                "Aprenda sobre",
                style: TextStyle(color: Color(0xFFF28A2F)),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AprendaSobrePage()),
                );
              },
            ),

            // BLOCO 2.2.6: Navegação para a tela de Contatos
            ListTile(
              leading: Icon(Icons.call),
              iconColor: Color(0xFFF28A2F),
              title: Text(
                "Contatos",
                style: TextStyle(color: Color(0xFFF28A2F)),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ContatosPage()),
                );
              },
            ),

            // BLOCO 2.2.7: Navegação para a tela de Políticas
            ListTile(
              leading: Icon(Icons.announcement_outlined),
              iconColor: Color(0xFFF28A2F),
              title: Text(
                "Nossas Políticas",
                style: TextStyle(color: Color(0xFFF28A2F)),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PoliticasPage()),
                );
              },
            ),
          ],
        ),
      ),

      // BLOCO 2.3: Barra inferior visível em todas as telas
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: 0,
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
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const AprendaSobrePage()),
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
