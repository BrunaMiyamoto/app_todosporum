import 'package:app_todosporum/app_bottom_nav.dart';
import 'package:app_todosporum/aprenda_sobre_page.dart';
import 'package:app_todosporum/contatos_page.dart';
import 'package:app_todosporum/forum_page.dart';
import 'package:app_todosporum/politicas_page.dart';
import 'package:app_todosporum/sobre_nos_page.dart';
import 'package:flutter/material.dart';

// ============================================================
// HOME / TELA INICIAL DO APP
// ============================================================
// Esta é a tela principal do aplicativo. Ela reúne:
// - o cabeçalho da página
// - o menu lateral (drawer)
// - a navegação inferior
// - o conteúdo da home com destaque e rodapé
//
// A estrutura foi organizada por blocos para facilitar a manutenção.
// Se você quiser alterar a página inicial, procure primeiro a seção
// correspondente ao bloco e mantenha o mesmo padrão de organização.
// ============================================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// ============================================================
// BLOCO 2: ESTADO DA HOME E ABA ATIVA
// ============================================================
// Este state controla qual conteúdo está sendo exibido na tela.
//
// _selectedIndex representa a aba atual selecionada na bottom bar.
// Quando esse valor muda, o app troca o corpo da tela entre as telas
// de pré-visualização da home, do fórum, do aprendizado e do perfil.
//
// Exemplo:
// - 0 = Home
// - 1 = Fórum
// - 2 = Aprender
// - 3 = Perfil
//
// Isso é a "fonte da verdade" da navegação da home. Qualquer alteração
// nesse valor afeta o que aparece na tela.
// ============================================================
class _HomeScreenState extends State<HomeScreen> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // ========================================================
    // BLOCO 2.1: LISTA DE TELAS DE CADA ABA
    // ========================================================
    // A lista abaixo mapeia cada índice para um widget visual.
    // Essa estrutura é a base da navegação da home. Se você quiser
    // adicionar uma nova aba, basta inserir mais um item aqui e não
    // esquecer de ajustar o índice e a navegação correspondente.
    //
    // Exemplo de duplicação:
    // 1. copie um widget de conteúdo já existente
    // 2. adicione a nova tela na lista
    // 3. conecte a nova aba ao BottomNavigationBar
    // ========================================================
    final screens = [
      const HomeContent(),
      const ForumPreview(),
      const LearnPreview(),
      const UserAreaPage(),
    ];

    return Scaffold(
      // ========================================================
      // BLOCO 2.2: CABEÇALHO E MENU LATERAL (DRAWER)
      // ========================================================
      // Aqui se define o topo da tela e o menu que abre ao clicar no
      // ícone do lado. O item do drawer também é uma rota de navegação
      // para outras páginas do app.
      //
      // Se você quiser adicionar um novo item ao menu, copie um
      // ListTile e troque o ícone, o texto e a rota de destino.
      // ========================================================
      appBar: _selectedIndex == 0
          ? AppBar(
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
            )
          : null,
      drawer: _selectedIndex == 0
          ? Drawer(
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
                    title: Text(
                      "Inicio",
                      style: TextStyle(color: Color(0xFFF28A2F)),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => HomeScreen()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.forum),
                    iconColor: Color(0xFFF28A2F),
                    title: Text(
                      "Fórum",
                      style: TextStyle(color: Color(0xFFF28A2F)),
                    ),
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
            )
          : null,

      body: screens[_selectedIndex],
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

// ============================================================
// BLOCO 3: CONTEÚDO PRINCIPAL DA HOME
// ============================================================
// Este widget reúne os blocos visuais da página inicial.
// A lógica aqui é simples: cada filho da Column representa uma seção
// diferente do layout.
//
// Estrutura da home:
// 1. HeroSection -> chamada principal com texto e CTA
// 2. CommunityHighlights -> destaques da comunidade
// 3. BottomFooter -> rodapé final
//
// Se você quiser duplicar uma seção, esse é o lugar mais fácil para
// alterar, remover ou incluir um novo bloco visual.
// ============================================================
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            const CommunityHighlights(),
            const BottomFooter(),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// BLOCO 3.1: PREVIEW DA ABA FORUM
// ============================================================
// Este widget é uma versão simples da aba do fórum para mostrar um
// placeholder visual enquanto a home navega entre as outras áreas.
//
// Em vez de exibir o conteúdo total do fórum, ele apenas mostra um
// ícone e funciona como "reserva" do espaço de navegação.
// ============================================================
class ForumPreview extends StatelessWidget {
  const ForumPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.forum, size: 80, color: Color(0xFF0A6D8E)),
    );
  }
}

// ============================================================
// BLOCO 3.2: PREVIEW DA ABA APRENDER
// ============================================================
// Assim como o Fórum, esta área é uma representação simples do conteúdo
// futuro de aprendizado. Ela ajuda a manter o fluxo da navegação da
// home sem abrir uma tela completa para cada aba.
//
// Se for criar uma tela real de aprendizado, esse bloco pode ser
// trocado por um widget com conteúdo completo.
// ============================================================
class LearnPreview extends StatelessWidget {
  const LearnPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.menu_book, size: 80, color: Color(0xFFF28A2F)),
    );
  }
}

// ============================================================
// BLOCO 4: BARRA SUPERIOR E LOGO DO APP
// ============================================================
// Este bloco representa a parte superior da interface do app.
// Ele não é a mesma coisa que a AppBar principal que aparece dentro do
// Scaffold da home, mas sim uma seção visual reutilizável para a parte
// de navegação e marca do aplicativo.
//
// Função dele:
// - mostrar o logo do app
// - exibir itens de navegação em linha ou em empilhamento no mobile
// - incluir o botão de Login/Registro
//
// Esse tipo de componente é muito útil para reaproveitar a mesma
// estrutura em outras telas. Se você quiser criar uma nova página com
// visual parecido, basta copiar esse bloco e trocar os textos e ações.
//
// Regras importantes:
// - navItems define os nomes dos itens de navegação
// - LayoutBuilder identifica se a tela está em mobile ou desktop
// - o botão de login é o elemento visual que fica em destaque na parte
//   superior direita
// ============================================================
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

// ============================================================
// BLOCO 4.1: LOGOTIPO DO APP
// ============================================================
// Esse widget cria a marca visual do app e normalmente fica no canto
// esquerdo da barra superior.
//
// Ele é composto por:
// - um círculo com gradiente azul
// - a sigla "TPU"
// - texto "TODOS POR UM" ao lado
//
// Como é um widget isolado, ele pode ser facilmente copiado e reutilizado
// em várias telas. Se quiser alterar a identidade visual do app, este é
// um ótimo ponto para mexer.
// ============================================================
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
          'TODOS POR UM',
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

// ============================================================
// BLOCO 5: HERO SECTION / CHAMADA PRINCIPAL DA HOME
// ============================================================
// Esta é a primeira grande seção visual que o usuário vê ao entrar na
// home. Ela funciona como um banner principal de destaque do app.
//
// O que ela contém:
// - título grande em destaque
// - texto explicativo
// - campo de texto para o usuário escrever uma ideia
// - botão para explorar o fórum
//
// A sua importância é dupla:
// 1. chamar atenção do usuário imediatamente
// 2. orientar a navegação para a parte de participação / fórum
//
// Se você quiser criar uma nova chamada principal ou uma nova landing
// page, esse bloco é o modelo ideal para servir de base.
// ============================================================
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

// ============================================================
// BLOCO 6: DESTAQUES DA COMUNIDADE
// ============================================================
// Esta seção mostra projetos ou ideias mais importantes da comunidade.
// Ela funciona como um "carrossel" horizontal de cards, permitindo que o
// usuário navegue entre diferentes propostas sem sair da tela.
//
// A estrutura aqui é composta por:
// - título da seção
// - PageView com vários cards
// - dados dinâmicos em uma lista chamada cards
//
// O estado dessa seção é controlado pelo PageController, que permite a
// rolagem horizontal. Isso é importante para tornar a seção interativa e
// visualmente mais dinâmica.
//
// Se quiser adicionar mais destaques, basta incluir novos itens na lista
// cards. O sistema já sabe renderizar automaticamente cada card.
// ============================================================
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

// ============================================================
// BLOCO 6.1: CARD INDIVIDUAL DE DESTAQUE
// ============================================================
// Cada card representa um projeto ou proposta específica.
//
// Ele contém:
// - tags da categoria do projeto
// - título do projeto
// - descrição detalhada
// - autor do projeto
// - visual em card branco com borda e sombra
//
// Esse tipo de widget é ótimo para duplicar. Se você quiser criar outro
// projeto, basta instanciar um novo CommunityCard com texto e tag diferentes.
// O layout já está pronto.
// ============================================================
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

// ============================================================
// BLOCO 7: RODAPÉ FINAL DA HOME
// ============================================================
// O rodapé é a última seção da página e costuma conter informações
// complementares e redes sociais.
//
// Neste projeto, ele está mais enxuto, mas a ideia é que ele sirva como
// fechamento da interface. Ele pode ser usado para:
// - avisos de direitos autorais
// - ícones de redes sociais
// - links rápidos
// - contato ou institucional
//
// Como é um bloco isolado, ele pode ser facilmente expandido sem afetar
// o restante da home.
// ============================================================
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

// ============================================================
// BLOCO 7.1: COLUNAS DO RODAPÉ
// ============================================================
// Este widget foi pensado para organizar links ou seções dentro do rodapé.
//
// A lógica é simples:
// - cada coluna recebe um título
// - recebe uma lista de textos/itens
// - renderiza os itens em coluna vertical
//
// No código atual ele está comentado, mas isso significa que essa parte
// foi planejada e pode ser reativada quando quiser montar um rodapé mais
// completo com navegação institucional.
// ============================================================
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

// ============================================================
// BLOCO 7.2: ÍCONES SOCIAIS DO RODAPÉ
// ============================================================
// Esse widget representa um ícone pequeno usado no fim da página, como
// redes sociais ou canais de contato.
//
// Ele é um componente simples: círculo com borda, fundo translúcido e um
// ícone central. Isso permite um visual limpo e uniforme sem repetir
// código em vários lugares.
//
// Se você quiser adicionar mais redes ou trocar o estilo, basta criar
// mais instâncias desse widget dentro do Row do rodapé.
// ============================================================
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
