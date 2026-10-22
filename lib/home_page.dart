import 'package:app_todosporum/aprenda_sobre_page.dart';
import 'package:app_todosporum/contatos_page.dart';
import 'package:app_todosporum/forum_page.dart';
import 'package:app_todosporum/politicas_page.dart';
import 'package:app_todosporum/sobre_nos_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/img/logo branco.png",
          height: 35,
          width: 70,
          fit: BoxFit.contain,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF28A2F),
                foregroundColor: Colors.white,
                shape: const CircleBorder(),
                padding: EdgeInsets.zero,
                minimumSize: const Size(45, 45),
                fixedSize: const Size(45, 45),
                elevation: 0,
              ),
              child: const Icon(Icons.login),
            ),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF0F3C4E)),
              child: Text(
                "Todos Por Um",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              iconColor: Color(0xFFF28A2F),
              title: Text("Inicio", style: TextStyle(color: Color(0xFFF28A2F))),
            ),
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
            ListTile(
              leading: Icon(Icons.article),
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
      ), //menu hamburguer

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const TopBar(
              //   navItems: [
              //     'Inicio',
              //     'Fórum',
              //     'Sobre Nós',
              //     'Aprenda Sobre',
              //     'Contato',
              //   ],
              // ),
              HeroSection(),
              const CommunityHighlights(),
              const BottomFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.navItems});

  final List<String> navItems;

  @override
  Widget build(BuildContext context) {
    final navWidgets = navItems
        .map(
          (item) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              item,
              style: const TextStyle(
                color: Color(0xFF0F2C3A),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
        .toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        final mobileLayout = constraints.maxWidth < 760;

        if (mobileLayout) {
          return Container(
            color: const Color(0xFFEAF3F5),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // children: [
                  //   const AppLogo(),
                  //   ElevatedButton(
                  //     onPressed: () {},
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: const Color(0xFFF28A2F),
                  //       foregroundColor: Colors.white,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(999),
                  //       ),
                  //       padding: const EdgeInsets.symmetric(
                  //         horizontal: 14,
                  //         vertical: 10,
                  //       ),
                  //       elevation: 0,
                  //     ),
                  //     child: const Text('+ Login|registre-se'),
                  //   ),
                  // ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 8,
                  children: navWidgets,
                ),
              ],
            ),
          );
        }

        return Container(
          color: const Color(0xFFEAF3F5),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            children: [
              const AppLogo(),
              const Spacer(),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: navWidgets),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF28A2F),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  elevation: 0,
                ),
                child: const Text('+ Login|registre-se'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFF0A6D8E), Color(0xFF1FA2C7)],
            ),
          ),
          child: const Center(
            child: Text(
              'TPU',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'TODOS\nPOR UM',
          style: TextStyle(
            color: Color(0xFF0A6D8E),
            fontWeight: FontWeight.w800,
            fontSize: 12,
            height: 1.1,
          ),
        ),
      ],
    );
  }
}

class HeroSection extends StatelessWidget {
  HeroSection({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 18),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF0D7D9A), Color(0xFF0F3C4E)],
        ),
      ),
      child: Column(
        children: [
          const Text(
            'ENVIE SUA IDEIA JÁ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 18),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Participe ativamente do debate público: envie projetos, proponha pautas, registre reclamações e interaja com outros cidadãos.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 26),
          SizedBox(
            width: 500,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Escreva aqui...',
                hintStyle: const TextStyle(color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: Color(0xFFF28A2F),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text(
              'Explore o Fórum',
              style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommunityHighlights extends StatefulWidget {
  const CommunityHighlights({super.key});

  @override
  State<CommunityHighlights> createState() => _CommunityHighlightsState();
}

class _CommunityHighlightsState extends State<CommunityHighlights> {
  late final PageController _pageController;

  final List<CommunityCard> cards = const [
    CommunityCard(
      tags: ['Ensino'],
      title:
          'Projeto "Educação Política nas Escolas" - Formação de Jovens Cidadãos',
      description:
          'Objetivo: Implementar oficinas e palestras sobre cidadania, política, direitos e deveres nas escolas públicas de Marília, promovendo o engajamento político desde a juventude.',
      author: 'Projeto por: Usuário0002',
      accent: Color(0xFF629643),
    ),
    CommunityCard(
      tags: ['Infraestrutura', 'Natureza'],
      title: 'Projeto "Praça Viva" - Revitalização de Espaços Públicos',
      description:
          'Objetivo: Transformar praças abandonadas ou pouco utilizadas em espaços comunitários ativos, com infraestrutura básica (bancos, iluminação, lixeiras).',
      author: 'Projeto por: Usuário0003',
      accent: Color(0xFF629643),
    ),
    CommunityCard(
      tags: ['Comunicação', 'Tecnologia'],
      title:
          'Projeto "Ouvidoria Cidadã Digital" - Plataforma de Escuta Popular',
      description:
          'Objetivo: Criar um canal digital de escuta permanente do povo, onde qualquer cidadão possa registrar sugestões, reclamações e ideias diretamente vinculadas às secretarias municipais e vereadores.',
      author: 'Projeto por: Todos por Um',
      accent: Color(0xFF629643),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.86);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFEAF3F5),
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 980),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'DESTAQUES DA COMUNIDADE',
                style: TextStyle(
                  color: Color(0xFF116B8E),
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                height: 360,
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  padEnds: true,
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: cards[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommunityCard extends StatelessWidget {
  const CommunityCard({
    super.key,
    required this.tags,
    required this.title,
    required this.description,
    required this.author,
    required this.accent,
  });

  final List<String> tags;
  final String title;
  final String description;
  final String author;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: tags
                      .map(
                        (tag) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF629643),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: accent, width: 1),
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                author,
                style: const TextStyle(
                  color: Color(0xFF1C4A5A),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFFE9702A),
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              color: Color(0xFF1F3A46),
              fontSize: 15,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomFooter extends StatelessWidget {
  const BottomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0B5F7A),
      padding: const EdgeInsets.fromLTRB(18, 28, 18, 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              // const SizedBox(height: 8),
              // Wrap(
              //   alignment: WrapAlignment.center,
              //   spacing: 28,
              //   runSpacing: 12,
              //   children: const [
              //     FooterColumn(
              //       title: 'Fórum',
              //       items: [
              //         'Posts em destaque',
              //         'Sua conta',
              //         'Suas postagens',
              //         'Segurança e privacidade',
              //         'Acessibilidade',
              //       ],
              //     ),
              //     FooterColumn(
              //       title: 'Sobre nós',
              //       items: ['Sobre o projeto', 'Nossos objetivos'],
              //     ),
              //     FooterColumn(title: 'Contato', items: ['Entre em contato']),
              //     FooterColumn(
              //       title: 'Aprenda',
              //       items: ['Sobre', 'Vídeos', 'Artigos'],
              //     ),
              //     FooterColumn(
              //       title: 'Nossas políticas',
              //       items: [
              //         'Políticas de privacidade',
              //         'Políticas de cookies',
              //         'Termos de Uso',
              //       ],
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 22),
              // const Divider(color: Colors.white54, thickness: 1),
              // const SizedBox(height: 12),
              const Text(
                'Todos os direitos reservados',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SocialIcon(icon: Icons.facebook),
                  SocialIcon(icon: Icons.close),
                  SocialIcon(icon: Icons.camera_alt),
                  SocialIcon(icon: Icons.mail_outline),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FooterColumn extends StatelessWidget {
  const FooterColumn({super.key, required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                item,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  const SocialIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white30),
      ),
      child: Icon(icon, size: 16, color: Colors.white),
    );
  }
}
