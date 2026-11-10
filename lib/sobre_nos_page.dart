import 'package:app_todosporum/app_bottom_nav.dart';
import 'package:app_todosporum/aprenda_sobre_page.dart';
import 'package:app_todosporum/contatos_page.dart';
import 'package:app_todosporum/forum_page.dart';
import 'package:app_todosporum/home_page.dart';
import 'package:app_todosporum/politicas_page.dart';
import 'package:flutter/material.dart';

// ============================================================
// PÁGINA "SOBRE NÓS"
// ============================================================
// Esta página é simples, mas importante, porque ela funciona como uma
// tela informativa do projeto e também dá acesso ao menu geral do app.
//
// A estrutura aqui é basicamente:
// 1. AppBar com título da página
// 2. Drawer com itens de navegação
// 3. ação de abrir outras telas ao clicar em cada item
//
// A ideia é manter a navegação consistente em todas as páginas e tornar
// a parte visual fácil de alterar sem mexer na lógica do app.
// ============================================================
class SobreNosPage extends StatefulWidget {
  const SobreNosPage({super.key});

  @override
  State<SobreNosPage> createState() => _SobreNosPageState();
}

// ============================================================
// BLOCO 2: CONSTRUÇÃO DA INTERFACE
// ============================================================
// Este state monta a página em si.
// O método build retorna a árvore de widgets que será mostrada na tela.
//
// Em Flutter, o build é o ponto central: tudo aquilo que aparece na tela
// deve estar aqui ou ser chamado por aqui. Quando você quiser duplicar
// uma seção, procure o bloco correspondente e siga a mesma ordem.
// ============================================================
class _SobreNosPageState extends State<SobreNosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // BLOCO 2.1: Cabeçalho da página
      appBar: AppBar(title: Text("Sobre Nós"), centerTitle: true),

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
