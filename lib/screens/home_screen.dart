import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';
import '../theme/theme_data.dart';
import '../data/manaqib_content.dart';
import '../services/bookmark_provider.dart';
class CategoryInfo {
  final String name;
  final String emoji;
  final String description;
  final Color color;

  const CategoryInfo(this.name, this.emoji, this.description, this.color);
}

const _categories = {
  'Shalawat': CategoryInfo('Shalawat', '🤲', 'Pujian & doa untuk Nabi Muhammad SAW', Color(0xFF1A6B5A)),
  'Dzikir': CategoryInfo('Dzikir', '📿', 'Zikir pagi, petang, & sehari-hari', Color(0xFF5BA4CF)),
  'Doa': CategoryInfo('Doa', '🤲', 'Doa pilihan setelah shalat & harian', Color(0xFFD4A843)),
  'Tawasul': CategoryInfo('Tawasul', '🕌', 'Pembacaan sebelum Manaqib Jailani', Color(0xFF8B5E3C)),
  'Maulid & Qasidah': CategoryInfo('Maulid & Qasidah', '📖', 'Barzanji, Simtudduror, Burdah, Diba\'', Color(0xFF7B4BAF)),
};

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarkProvider = context.watch<BookmarkProvider>();
    final theme = Theme.of(context);
    final arabicFont = context.watch<ThemeProvider>().arabicFontOption;
    // Manaqib Jailani — featured, separate from regular categories
    const manaqibJailaniId = 10;
    final categories = <String>[...{...allManaqibList
        .where((m) => m.id != manaqibJailaniId)
        .map((m) => m.category)}];
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.mosque, size: 22, color: AppColors.gold),
            const SizedBox(width: 8),
            Text(
              'Manaqib',
              style: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.w700,
                color: isDark ? AppColors.gold : Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await bookmarkProvider.loadBookmarks();
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 8),

            // ✨ Hero Header Card — gradient emerald with Islamic feel
            _HeroHeaderCard(
              bookmarkCount: bookmarkProvider.count,
              isDark: isDark,
            ),
            const SizedBox(height: 24),

            // ✨ Featured — Manaqib Syekh Abdul Qadir Al-Jailani
            _ManaqibJailaniCard(
              isDark: isDark,
              onTap: () => context.push('/reading/$manaqibJailaniId'),
            ),
            const SizedBox(height: 28),

            // ✨ Story Circles — category quick access
            SizedBox(
              height: 64,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final info = _categories[category]!;
                  final count =
                      allManaqibList.where((m) => m.category == category).length;
                  return _CategoryCircle(
                    emoji: info.emoji,
                    label: info.name,
                    count: count,
                    color: info.color,
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // ✨ Category sections with styled cards
            for (final category in categories) ...[
              // Section header
              _SectionHeader(
                title: category,
                description: _categories[category]?.description ?? '',
                color: _categories[category]?.color ?? AppColors.primary,
              ),

              // Content cards
              ...allManaqibList
                  .where((m) => m.category == category)
                  .map(
                    (manaqib) => _ContentCard(
                      manaqib: manaqib,
                      category: category,
                      categoryColor:
                          _categories[category]?.color ?? AppColors.primary,
                      isBookmarked: bookmarkProvider.isBookmarked(manaqib.id),
                      arabicFont: arabicFont,
                      theme: theme,
                      isDark: isDark,
                      onTap: () => context.push('/reading/${manaqib.id}'),
                    ),
                  ),
              const SizedBox(height: 12),
            ],

            // Bottom padding for nav bar
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}

// ─── Hero Header Card ────────────────────────────────────────────────

class _HeroHeaderCard extends StatelessWidget {
  final int bookmarkCount;
  final bool isDark;

  const _HeroHeaderCard({
    required this.bookmarkCount,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.primaryDark,
            Color(0xFF062220),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Geometric pattern overlay
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Opacity(
                opacity: 0.06,
                child: CustomPaint(
                  painter: _IslamicPatternPainter(),
                ),
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Assalamu\'alaikum',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 14,
                    color: AppColors.gold.withValues(alpha: 0.9),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Bacaan Doa & Dzikir',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Masjid Darussa\'adah',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 13,
                    color: Colors.white.withValues(alpha: 0.6),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),

                // Stats row
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      _StatChip(
                        icon: Icons.menu_book_rounded,
                        label: '${allManaqibList.length} Bacaan',
                        color: AppColors.gold,
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 1,
                        height: 24,
                        color: Colors.white.withValues(alpha: 0.15),
                      ),
                      const SizedBox(width: 12),
                      _StatChip(
                        icon: Icons.bookmark_rounded,
                        label: '$bookmarkCount Tersimpan',
                        color: AppColors.skyBlue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Manaqib Jailani Featured Card ──────────────────────────────────

class _ManaqibJailaniCard extends StatelessWidget {
  final bool isDark;
  final VoidCallback onTap;

  const _ManaqibJailaniCard({
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF8B5E3C),
              Color(0xFF6B4226),
              Color(0xFF3D2415),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF8B5E3C).withValues(alpha: 0.25),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Geometric pattern overlay
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Opacity(
                  opacity: 0.06,
                  child: CustomPaint(
                    painter: _IslamicPatternPainter(),
                  ),
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  // Left: mosque icon in circle
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                        width: 1.5,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        '🕌',
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Right: text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.gold.withValues(alpha: 0.25),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            '⭐ Pembacaan Khusus',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: AppColors.gold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Manaqib Syekh Abdul Qadir\nAl-Jailani',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            height: 1.35,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Thoriqoh Qodiriyyah — 14 bagian',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withValues(alpha: 0.55),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Arrow
                  Icon(
                    Icons.chevron_right,
                    color: Colors.white.withValues(alpha: 0.3),
                    size: 22,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Stat Chip ───────────────────────────────────────────────────────

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _StatChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// ─── Category Circle (Story) ─────────────────────────────────────────

class _CategoryCircle extends StatelessWidget {
  final String emoji;
  final String label;
  final int count;
  final Color color;

  const _CategoryCircle({
    required this.emoji,
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withValues(alpha: 0.25),
          width: 1.5,
        ),
      ),
      child: Center(
        child: Text(
          emoji,
          style: const TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}

// ─── Section Header ──────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  final String description;
  final Color color;

  const _SectionHeader({
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.45),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Content Card ────────────────────────────────────────────────────

class _ContentCard extends StatelessWidget {
  final dynamic manaqib;
  final String category;
  final Color categoryColor;
  final bool isBookmarked;
  final ArabicFontOption arabicFont;
  final ThemeData theme;
  final bool isDark;
  final VoidCallback onTap;

  const _ContentCard({
    required this.manaqib,
    required this.category,
    required this.categoryColor,
    required this.isBookmarked,
    required this.arabicFont,
    required this.theme,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Left accent bar
                Container(
                  width: 4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: categoryColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        manaqib.title as String,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        manaqib.arabicTitle as String,
                        style: arabicFont.textStyle(
                          color: AppColors.primaryLight,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        manaqib.description as String,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                          fontSize: 12,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    if (isBookmarked)
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Icon(
                          Icons.bookmark,
                          color: AppColors.gold,
                          size: 18,
                        ),
                      ),
                    Icon(
                      Icons.chevron_right,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.25),
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Islamic Geometric Pattern Painter ───────────────────────────────

class _IslamicPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFFFFF)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    const spacing = 40.0;
    const outerR = 14.0;
    const innerR = 7.0;

    for (double x = -spacing; x < size.width + spacing; x += spacing) {
      for (double y = -spacing; y < size.height + spacing; y += spacing) {
        // Draw 8-pointed star
        final path = Path();
        for (int i = 0; i < 16; i++) {
          final angle = (i * 22.5) * math.pi / 180;
          final r = i.isEven ? outerR : innerR;
          final px = x + r * math.cos(angle);
          final py = y + r * math.sin(angle);
          if (i == 0) {
            path.moveTo(px, py);
          } else {
            path.lineTo(px, py);
          }
        }
        path.close();
        canvas.drawPath(path, paint);

        // Inner diamond
        final inner = Path();
        inner.moveTo(x, y - innerR);
        inner.lineTo(x + innerR, y);
        inner.lineTo(x, y + innerR);
        inner.lineTo(x - innerR, y);
        inner.close();
        canvas.drawPath(inner, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
