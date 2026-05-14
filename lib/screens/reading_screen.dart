import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../data/manaqib_content.dart';
import '../models/manaqib.dart';
import '../services/bookmark_provider.dart';
import '../theme/theme_data.dart';
import '../theme/theme_provider.dart';

class ReadingScreen extends StatefulWidget {
  final int manaqibId;

  const ReadingScreen({super.key, required this.manaqibId});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen>
    with SingleTickerProviderStateMixin {
  double _fontSize = 22.0;
  bool _showLatin = true;
  bool _showTranslation = true;

  late final PageController _pageController;
  int _currentSectionIndex = 0;

  // Swipe hint animation
  late final AnimationController _swipeHintController;
  late final Animation<double> _swipeHintAnimation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _swipeHintController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _swipeHintAnimation = Tween<double>(begin: 0, end: -20).animate(
      CurvedAnimation(
        parent: _swipeHintController,
        curve: Curves.easeInOut,
      ),
    );
    // Play swipe hint after a short delay if multiple sections
    final manaqib = _manaqib;
    if (manaqib != null && manaqib.sections.length > 1) {
      Future.delayed(const Duration(milliseconds: 800), () {
        if (mounted) _swipeHintController.forward();
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _swipeHintController.dispose();
    super.dispose();
  }

  Manaqib? get _manaqib {
    try {
      return allManaqibList.firstWhere((m) => m.id == widget.manaqibId);
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final manaqib = _manaqib;
    final bookmarkProvider = context.watch<BookmarkProvider>();
    final theme = Theme.of(context);
    final arabicFont = context.watch<ThemeProvider>().arabicFontOption;
    final isDark = theme.brightness == Brightness.dark;

    if (manaqib == null) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline_rounded, size: 22, color: AppColors.gold),
              const SizedBox(width: 8),
              Text(
                'Tidak Ditemukan',
                style: GoogleFonts.playfairDisplay(
                  fontWeight: FontWeight.w700,
                  color: isDark ? AppColors.gold : Colors.white,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: const Center(child: Text('Bacaan tidak ditemukan')),
      );
    }

    final isBookmarked = bookmarkProvider.isBookmarked(manaqib.id);
    final sectionCount = manaqib.sections.length;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.menu_book_rounded, size: 22, color: AppColors.gold),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                manaqib.title,
                style: GoogleFonts.playfairDisplay(
                  fontWeight: FontWeight.w700,
                  color: isDark ? AppColors.gold : Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          // Bookmark with gold highlight
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
              color: isBookmarked ? AppColors.gold : null,
            ),
            onPressed: () => bookmarkProvider.toggleBookmark(manaqib.id),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                switch (value) {
                  case 'latin':
                    _showLatin = !_showLatin;
                  case 'translation':
                    _showTranslation = !_showTranslation;
                  case 'font_up':
                    _fontSize = (_fontSize + 2).clamp(16.0, 36.0);
                  case 'font_down':
                    _fontSize = (_fontSize - 2).clamp(16.0, 36.0);
                  case 'font_amiri':
                    context.read<ThemeProvider>().setArabicFont(ArabicFontOption.amiri);
                  case 'font_scheherazade':
                    context.read<ThemeProvider>().setArabicFont(ArabicFontOption.scheherazadeNew);
                  case 'font_kufi':
                    context.read<ThemeProvider>().setArabicFont(ArabicFontOption.notoKufiArabic);
                }
              });
            },
            itemBuilder: (context) => [
              _buildFontMenuSection(theme, arabicFont),
              _buildFontItem(
                'font_amiri',
                ArabicFontOption.amiri,
                arabicFont == ArabicFontOption.amiri,
                theme,
              ),
              _buildFontItem(
                'font_scheherazade',
                ArabicFontOption.scheherazadeNew,
                arabicFont == ArabicFontOption.scheherazadeNew,
                theme,
              ),
              _buildFontItem(
                'font_kufi',
                ArabicFontOption.notoKufiArabic,
                arabicFont == ArabicFontOption.notoKufiArabic,
                theme,
              ),
              const PopupMenuDivider(),
              _buildToggleItem(
                'latin',
                Icons.format_quote_rounded,
                'Tampilin teks latin',
                _showLatin,
                theme,
              ),
              _buildToggleItem(
                'translation',
                Icons.translate_rounded,
                'Tampilin arti bahasa',
                _showTranslation,
                theme,
              ),
              const PopupMenuDivider(),
              _buildActionItem(
                'font_up',
                Icons.text_increase_rounded,
                'Huruf lebih besar',
                theme,
              ),
              _buildActionItem(
                'font_down',
                Icons.text_decrease_rounded,
                'Huruf lebih kecil',
                theme,
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // ✨ Enhanced section indicator
          if (sectionCount > 1)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: (isDark ? AppColors.darkSurface : AppColors.lightSurface)
                    .withValues(alpha: 0.8),
                border: Border(
                  bottom: BorderSide(
                    color: theme.colorScheme.outline.withValues(alpha: 0.3),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Previous button
                  if (_currentSectionIndex > 0)
                    GestureDetector(
                      onTap: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Icon(
                          Icons.chevron_left_rounded,
                          size: 22,
                          color: AppColors.primary.withValues(alpha: 0.6),
                        ),
                      ),
                    ),

                  // Section dots
                  ...List.generate(sectionCount, (i) {
                    final isActive = i == _currentSectionIndex;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: isActive ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: isActive
                            ? AppColors.primary
                            : theme.colorScheme.onSurface.withValues(alpha: 0.15),
                        boxShadow: isActive
                            ? [
                                BoxShadow(
                                  color: AppColors.primary.withValues(alpha: 0.3),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : null,
                      ),
                    );
                  }),

                  // Next button
                  if (_currentSectionIndex < sectionCount - 1)
                    GestureDetector(
                      onTap: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Icon(
                          Icons.chevron_right_rounded,
                          size: 22,
                          color: AppColors.primary.withValues(alpha: 0.6),
                        ),
                      ),
                    ),
                ],
              ),
            ),

          // Content
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: sectionCount,
              onPageChanged: (index) {
                setState(() => _currentSectionIndex = index);
              },
              itemBuilder: (context, index) {
                final section = manaqib.sections[index];
                return SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Section title with decorative divider
                      if (sectionCount > 1) ...[
                        Text(
                          section.title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        // Ornamental divider
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: theme.colorScheme.outline.withValues(alpha: 0.15),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Icon(
                                Icons.auto_awesome,
                                size: 14,
                                color: AppColors.gold.withValues(alpha: 0.5),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: theme.colorScheme.outline.withValues(alpha: 0.15),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                      ],

                      // ✨ Arabic text — decorative card with border ornament
                      _ArabicTextCard(
                        arabicText: section.arabicText,
                        arabicFont: arabicFont,
                        fontSize: _fontSize,
                        theme: theme,
                        isDark: isDark,
                      ),

                      // Latin text
                      if (_showLatin && section.latinText != null) ...[
                        const SizedBox(height: 20),
                        _LatinText(
                          latinText: section.latinText!,
                          fontSize: _fontSize - 6,
                          theme: theme,
                        ),
                      ],

                      // Translation card
                      if (_showTranslation) ...[
                        const SizedBox(height: 20),
                        _TranslationCard(
                          translation: section.translation,
                          fontSize: _fontSize - 6,
                          theme: theme,
                          isDark: isDark,
                        ),
                      ],

                      // Source note
                      if (section.sourceNote != null &&
                          section.sourceNote!.isNotEmpty) ...[
                        const SizedBox(height: 20),
                        _SourceNote(
                          sourceNote: section.sourceNote!,
                          theme: theme,
                        ),
                      ],

                      const SizedBox(height: 32),

                      // ✨ Page indicator with swipe hint
                      AnimatedBuilder(
                        animation: _swipeHintAnimation,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: sectionCount > 1 && _currentSectionIndex == 0
                                ? Offset(_swipeHintAnimation.value, 0)
                                : Offset.zero,
                            child: child,
                          );
                        },
                        child: _PageIndicator(
                          current: index + 1,
                          total: sectionCount,
                          theme: theme,
                        ),
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ─── Menu Builders ─────────────────────────────────────────────────

  PopupMenuItem<String> _buildFontMenuSection(
    ThemeData theme,
    ArabicFontOption arabicFont,
  ) {
    return PopupMenuItem(
      enabled: false,
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(
            Icons.text_fields_rounded,
            size: 18,
            color: theme.colorScheme.primary.withValues(alpha: 0.5),
          ),
          const SizedBox(width: 8),
          Text(
            'Font Arab',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              arabicFont.label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem<String> _buildFontItem(
    String value,
    ArabicFontOption font,
    bool isSelected,
    ThemeData theme,
  ) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(
            isSelected
                ? Icons.radio_button_checked_rounded
                : Icons.radio_button_unchecked_rounded,
            size: 20,
            color: isSelected ? AppColors.primary : null,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(font.label),
          ),
          Text(
            font.description,
            style: TextStyle(
              fontSize: 11,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem<String> _buildToggleItem(
    String value,
    IconData icon,
    String label,
    bool isActive,
    ThemeData theme,
  ) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(
            isActive
                ? Icons.check_box_rounded
                : Icons.check_box_outline_blank_rounded,
            size: 20,
            color: isActive ? AppColors.primary : null,
          ),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }

  PopupMenuItem<String> _buildActionItem(
    String value,
    IconData icon,
    String label,
    ThemeData theme,
  ) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}

// ─── Arabic Text Card ────────────────────────────────────────────────

class _ArabicTextCard extends StatelessWidget {
  final String arabicText;
  final ArabicFontOption arabicFont;
  final double fontSize;
  final ThemeData theme;
  final bool isDark;

  const _ArabicTextCard({
    required this.arabicText,
    required this.arabicFont,
    required this.fontSize,
    required this.theme,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurfaceVariant.withValues(alpha: 0.5)
            : AppColors.primary.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.15),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: isDark ? 0.1 : 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Corner ornaments
          Positioned(
            top: 8,
            left: 8,
            child: _CornerOrnament(position: 'topLeft'),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: _CornerOrnament(position: 'topRight'),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: _CornerOrnament(position: 'bottomLeft'),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: _CornerOrnament(position: 'bottomRight'),
          ),

          // Arabic text
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              arabicText,
              textAlign: TextAlign.center,
              style: arabicFont.textStyle(
                fontSize: fontSize,
                height: 2.2,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Corner Ornament ─────────────────────────────────────────────────

class _CornerOrnament extends StatelessWidget {
  final String position;

  const _CornerOrnament({required this.position});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(16, 16),
      painter: _CornerPainter(position: position),
    );
  }
}

class _CornerPainter extends CustomPainter {
  final String position;

  _CornerPainter({required this.position});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.gold.withValues(alpha: 0.4)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    const len = 12.0;
    final path = Path();

    switch (position) {
      case 'topLeft':
        path.moveTo(0, len);
        path.lineTo(0, 0);
        path.lineTo(len, 0);
      case 'topRight':
        path.moveTo(size.width - len, 0);
        path.lineTo(size.width, 0);
        path.lineTo(size.width, len);
      case 'bottomLeft':
        path.moveTo(0, size.height - len);
        path.lineTo(0, size.height);
        path.lineTo(len, size.height);
      case 'bottomRight':
        path.moveTo(size.width - len, size.height);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width, size.height - len);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─── Latin Text ──────────────────────────────────────────────────────

class _LatinText extends StatelessWidget {
  final String latinText;
  final double fontSize;
  final ThemeData theme;

  const _LatinText({
    required this.latinText,
    required this.fontSize,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      latinText,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontStyle: FontStyle.italic,
        color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
        height: 1.8,
        letterSpacing: 0.2,
      ),
    );
  }
}

// ─── Translation Card ────────────────────────────────────────────────

class _TranslationCard extends StatelessWidget {
  final String translation;
  final double fontSize;
  final ThemeData theme;
  final bool isDark;

  const _TranslationCard({
    required this.translation,
    required this.fontSize,
    required this.theme,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.primaryDark.withValues(alpha: 0.3)
            : AppColors.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border(
          left: BorderSide(
            color: AppColors.primary.withValues(alpha: 0.4),
            width: 3,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.translate_rounded,
                size: 14,
                color: AppColors.primary.withValues(alpha: 0.5),
              ),
              const SizedBox(width: 6),
              Text(
                'Arti Bahasa',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary.withValues(alpha: 0.6),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            translation,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: fontSize,
              color: theme.colorScheme.onSurface,
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Source Note ─────────────────────────────────────────────────────

class _SourceNote extends StatelessWidget {
  final String sourceNote;
  final ThemeData theme;

  const _SourceNote({
    required this.sourceNote,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.menu_book_rounded,
            size: 13,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              sourceNote,
              style: TextStyle(
                fontSize: 11,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.35),
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Page Indicator ──────────────────────────────────────────────────

class _PageIndicator extends StatelessWidget {
  final int current;
  final int total;
  final ThemeData theme;

  const _PageIndicator({
    required this.current,
    required this.total,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Decorative dots
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            color: AppColors.gold.withValues(alpha: 0.5),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '$current',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
        Text(
          ' dari $total bagian',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            color: AppColors.gold.withValues(alpha: 0.5),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
