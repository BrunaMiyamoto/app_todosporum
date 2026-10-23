import 'package:app_todosporum/app_bottom_nav.dart';
import 'package:app_todosporum/aprenda_sobre_page.dart';
import 'package:app_todosporum/home_page.dart';
import 'package:flutter/material.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  final List<String> _categories = ['Projetos', 'Reclamações', 'Dúvidas'];
  final List<String> _allTags = [
    'Educação',
    'Infraestrutura',
    'Sustentabilidade',
    'Política',
    'Tecnologia',
    'Cidadania',
    'Saúde',
    'Lazer',
    'Segurança Pública',
    'Empregabilidade e Renda',
    'Administração Pública',
    'Transporte',
    'Direitos Humanos e Inclusão',
    'Planejamento e Orçamento',
  ];

  String _selectedCategory = 'Projetos';
  String? _selectedTag;

  final List<_ForumPostData> _posts = const [
    _ForumPostData(
      tag: 'Ensino',
      author: 'Usuário0002',
      title:
          'Projeto "Educação Política nas Escolas" - Formação de Jovens Cidadãos',
      summary:
          'Objetivo: Implementar oficinas e palestras sobre cidadania, política, direitos e deveres nas escolas públicas de Marília, promovendo o engajamento político desde a juventude.',
    ),
    _ForumPostData(
      tag: 'Infraestrutura',
      author: 'Usuário0003',
      title: 'Projeto "Praça Viva" - Revitalização de Espaços Públicos',
      summary:
          'Objetivo: Transformar praças abandonadas ou pouco utilizadas em espaços comunitários ativos, com infraestrutura básica, bancos, iluminação e lixeiras.',
    ),
    _ForumPostData(
      tag: 'Comunicação',
      author: 'Todos por Um',
      title:
          'Projeto "Ouvidoria Cidadã Digital" - Plataforma de Escuta Popular',
      summary:
          'Objetivo: Criar um canal digital de escuta permanente do povo, onde qualquer cidadão possa registrar sugestões, reclamações e ideias diretamente vinculadas às secretarias municipais e vereadores.',
    ),
  ];

  List<_ForumPostData> get _filteredPosts {
    return _posts.where((post) {
      final categoryMatches =
          post.tag == 'Ensino' ||
          post.tag == 'Infraestrutura' ||
          post.tag == 'Comunicação';
      return categoryMatches &&
          (_selectedTag == null ||
              post.tag == _selectedTag ||
              _selectedTag == 'Todos');
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final posts = _filteredPosts;

    return Scaffold(
      backgroundColor: const Color(0xFFEAF3F5),
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF0F3C4E)),
              child: Text(
                'Todos Por Um',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              iconColor: const Color(0xFFF28A2F),
              title: const Text(
                'Início',
                style: TextStyle(color: Color(0xFFF28A2F)),
              ),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.forum),
              iconColor: const Color(0xFFF28A2F),
              title: const Text(
                'Fórum',
                style: TextStyle(color: Color(0xFFF28A2F)),
              ),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              color: const Color(0xFFC8DDE6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Color(0xFF0F3C4E),
                      size: 36,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/img/logo branco.png',
                        height: 36,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: const Color(0xFFEAF3F5),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: _ForumCategoryRow(
                categories: _categories,
                selectedCategory: _selectedCategory,
                onSelect: (category) {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 54,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Pesquisar por uma publicação...',
                    hintStyle: const TextStyle(
                      color: Color(0xFF6A7F8B),
                      fontSize: 15,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF0A6D8E)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF0A6D8E)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFF0A6D8E),
                        width: 2,
                      ),
                    ),
                    suffixIcon: Container(
                      margin: const EdgeInsets.only(left: 8),
                      width: 54,
                      decoration: const BoxDecoration(
                        color: Color(0xFF5E9A43),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              height: 52,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF5E9A43),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  '+ Criar Post',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 44,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _allTags.length + 1,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final isAll = index == 0;
                    final tag = isAll ? 'Todos' : _allTags[index - 1];
                    final isSelected =
                        _selectedTag == tag || (isAll && _selectedTag == null);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTag = isAll ? null : tag;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        constraints: const BoxConstraints(minWidth: 100),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF0A6D8E)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF0A6D8E)
                                : const Color(0xFFD8E7EC),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          tag,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF0F2C3A),
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                itemCount: posts.length,
                separatorBuilder: (context, _) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final post = posts[index];
                  final tagColor = index % 3 == 0
                      ? const Color(0xFF5E9A43)
                      : index % 3 == 1
                      ? const Color(0xFF0A6D8E)
                      : const Color(0xFFF28A2F);

                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.72),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE3EEF2)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: tagColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                post.tag,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'Projeto por: ${post.author}',
                              style: const TextStyle(
                                color: Color(0xFF1F3A46),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          post.title,
                          style: const TextStyle(
                            color: Color(0xFFF28A2F),
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Objetivo: ${post.summary}',
                          style: const TextStyle(
                            color: Color(0xFF1F3A46),
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ForumCategoryRow extends StatelessWidget {
  const _ForumCategoryRow({
    required this.categories,
    required this.selectedCategory,
    required this.onSelect,
  });

  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF5F6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD8E7EC)),
      ),
      child: Row(
        children: List.generate(categories.length, (index) {
          final isSelected = categories[index] == selectedCategory;
          return Expanded(
            child: GestureDetector(
              onTap: () => onSelect(categories[index]),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: isSelected
                        ? const Color(0xFF0F3C4E)
                        : const Color(0xFF4E6D7B),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _ForumPostData {
  const _ForumPostData({
    required this.tag,
    required this.author,
    required this.title,
    required this.summary,
  });

  final String tag;
  final String author;
  final String title;
  final String summary;
}
