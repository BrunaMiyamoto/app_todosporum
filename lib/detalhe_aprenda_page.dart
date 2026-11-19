import 'package:app_todosporum/app_bottom_nav.dart';
import 'package:app_todosporum/aprenda_sobre_page.dart';
import 'package:app_todosporum/contatos_page.dart';
import 'package:app_todosporum/forum_page.dart';
import 'package:app_todosporum/home_page.dart';
import 'package:app_todosporum/politicas_page.dart';
import 'package:app_todosporum/sobre_nos_page.dart';
import 'package:flutter/material.dart';

class DetalheAprendaPage extends StatefulWidget {
  const DetalheAprendaPage({super.key});

  @override
  State<DetalheAprendaPage> createState() => _DetalheAprendaPageState();
}

class _DetalheAprendaPageState extends State<DetalheAprendaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // BLOCO 2.1: Cabeçalho da página
      appBar: AppBar(
        title: Text(
          "Aprenda Sobre",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF0A6D8E),
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),

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

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsetsGeometry.symmetric(vertical: 20),
            child: ListTile(
              title: Text(
                "O Todos Por Um nasceu como uma iniciativa de estudantes de um curso técnico em tecnologia, fomos desafiados a criar uma solução que contribuísse para os Objetivos de Desenvolvimento Sustentável da Agenda 2030 (ODS) e, ao olhar para nossa realidade, percebemos que a verdadeira mudança começa quando todos se sentem parte dela.Entendemos que transformar a sociedade exige mais do que boas intenções: é preciso agir na causa, estimular a participação e abrir espaço para que cada cidadão tenha voz. Acreditamos que a força de uma cidade está nas pessoas que a constroem todos os dias. Por isso, unimos nossos conhecimentos técnicos às vivências e experiências de cada integrante do grupo, somando esforços com parceiros que compartilham do mesmo propósito.Criamos um projeto que utiliza a tecnologia como ferramenta de cidadania ativa, buscando simplificar processos burocráticos e fortalecer o vínculo entre a população e a Câmara Municipal de Marília. Nosso propósito é inspirar a participação popular, aproximando o mariliense das decisões que moldam sua cidade. Por meio da nossa plataforma digital, oferecemos um canal direto de comunicação com o poder público, onde as demandas da comunidade são registradas, acompanhadas e transformadas em oportunidades reais de mudança.Mais do que uma ferramenta digital, o Todos Por Um é um movimento coletivo por uma Marília mais participativa, conectada e consciente de seu poder transformador.",

                textAlign: TextAlign.justify,
              ),

              subtitle: Image.asset("assets/img/logo branco.png"),
            ),
          ),
        ],
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
