import 'package:flutter/material.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF3F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F3C4E),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/img/logo branco.png',
          height: 35,
          width: 70,
          fit: BoxFit.contain,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            children: [
              _ForumHero(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Discussões em alta',
                          style: TextStyle(
                            color: Color(0xFF0F2C3A),
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF28A2F),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            elevation: 0,
                          ),
                          icon: const Icon(Icons.add, size: 18),
                          label: const Text('Nova discussão'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    const _ForumCategoryRow(),
                    const SizedBox(height: 22),
                    const _ForumPostCard(
                      title: 'Atenção à mobilidade urbana no bairro central',
                      summary:
                          'Precisamos discutir melhorias em calçadas, sinalização e segurança para pedestres. Quem já passou por isso pode compartilhar exemplos práticos e soluções viáveis.',
                      tags: ['Mobilidade', 'Segurança', 'Cidadania'],
                      author: 'Fernanda M.',
                      comments: 24,
                      likes: 88,
                      accent: Color(0xFF0A6D8E),
                    ),
                    const SizedBox(height: 16),
                    const _ForumPostCard(
                      title: 'Projeto de educação para jovens em risco social',
                      summary:
                          'Quero propor uma sugestão para ampliar oficinas, cursos e ações de convivência comunitária para adolescentes e jovens do município.',
                      tags: ['Educação', 'Jovens', 'Comunidade'],
                      author: 'Marcelo R.',
                      comments: 17,
                      likes: 63,
                      accent: Color(0xFF629643),
                    ),
                    const SizedBox(height: 16),
                    const _ForumPostCard(
                      title:
                          'Como tornar os espaços públicos mais acolhedores?',
                      summary:
                          'Compartilhe ideias para criar praças, áreas de lazer e iluminação mais acessíveis, inclusivas e seguras para toda a população.',
                      tags: ['Infraestrutura', 'Acessibilidade', 'Praças'],
                      author: 'Ana L.',
                      comments: 31,
                      likes: 104,
                      accent: Color(0xFFF28A2F),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ForumHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 28, 18, 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF0D7D9A), Color(0xFF0F3C4E)],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 980),
          child: Column(
            children: [
              const Text(
                'FÓRUM DA COMUNIDADE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 14),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Troque ideias, compartilhe demandas, proponha soluções e acompanhe o que a comunidade está discutindo em tempo real.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: 560,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Pesquisar no fórum...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFF0A6D8E),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
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
              const SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 12,
                children: const [
                  _ForumStatChip(
                    label: '2.4k membros',
                    icon: Icons.people_alt_rounded,
                  ),
                  _ForumStatChip(
                    label: '156 tópicos',
                    icon: Icons.article_outlined,
                  ),
                  _ForumStatChip(
                    label: '91 em debate',
                    icon: Icons.trending_up_rounded,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ForumCategoryRow extends StatelessWidget {
  const _ForumCategoryRow();

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Todos',
      'Educação',
      'Saúde',
      'Mobilidade',
      'Segurança',
      'Infraestrutura',
      'Meio Ambiente',
    ];

    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final selected = index == 0;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selected ? const Color(0xFF0A6D8E) : Colors.white,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: selected
                    ? const Color(0xFF0A6D8E)
                    : const Color(0xFFDCE8EC),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              categories[index],
              style: TextStyle(
                color: selected ? Colors.white : const Color(0xFF0F2C3A),
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ForumStatChip extends StatelessWidget {
  const _ForumStatChip({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 16),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _ForumPostCard extends StatelessWidget {
  const _ForumPostCard({
    required this.title,
    required this.summary,
    required this.tags,
    required this.author,
    required this.comments,
    required this.likes,
    required this.accent,
  });

  final String title;
  final String summary;
  final List<String> tags;
  final String author;
  final int comments;
  final int likes;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE3EEF2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
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
                            color: accent.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: accent.withValues(alpha: 0.45),
                            ),
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              color: accent,
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                author,
                style: const TextStyle(
                  color: Color(0xFF1C4A5A),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF0F2C3A),
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            summary,
            style: const TextStyle(
              color: Color(0xFF1F3A46),
              fontSize: 15,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              _ForumMetric(icon: Icons.chat_bubble_outline, value: '$comments'),
              const SizedBox(width: 18),
              _ForumMetric(icon: Icons.favorite_border, value: '$likes'),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF0A6D8E),
                  padding: EdgeInsets.zero,
                ),
                child: const Text(
                  'Ver discussão',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ForumMetric extends StatelessWidget {
  const _ForumMetric({required this.icon, required this.value});

  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF0A6D8E)),
        const SizedBox(width: 6),
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF0A6D8E),
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
