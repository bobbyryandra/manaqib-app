import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../data/manaqib_content.dart';
import '../models/manaqib.dart';
import '../services/bookmark_provider.dart';
import '../theme/theme_provider.dart';

class ReadingScreen extends StatefulWidget {
  final int manaqibId;

  const ReadingScreen({super.key, required this.manaqibId});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  double _fontSize = 22.0;
  bool _showLatin = true;
  bool _showTranslation = true;

  late final PageController _pageController;
  int _currentSectionIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Manaqib? get _manaqib {
    try {
      return manaqibList.firstWhere((m) => m.id == widget.manaqibId);
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

    if (manaqib == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Tidak Ditemukan')),
        body: const Center(child: Text('Bacaan tidak ditemukan')),
      );
    }

    final isBookmarked = bookmarkProvider.isBookmarked(manaqib.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(manaqib.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
              color: isBookmarked ? theme.colorScheme.primary : null,
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
              PopupMenuItem(
                value: 'latin',
                child: Row(
                  children: [
                    Icon(
                      _showLatin ? Icons.check_box : Icons.check_box_outline_blank,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    const Text('Tampilin teks'),
                    const Spacer(),
                    Text(
                      arabicFont.label,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 16,
                      color: theme.colorScheme.primary,
                    ),
                  ],
                ),
              ),
              // Font options - shown as small items below
              PopupMenuItem(
                value: 'font_amiri',
                height: 36,
                padding: const EdgeInsets.only(left: 48, right: 16),
                child: Row(
                  children: [
                    Icon(
                      arabicFont == ArabicFontOption.amiri
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      size: 18,
                      color: arabicFont == ArabicFontOption.amiri
                          ? theme.colorScheme.primary
                          : null,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Amiri',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: arabicFont == ArabicFontOption.amiri
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'font_scheherazade',
                height: 36,
                padding: const EdgeInsets.only(left: 48, right: 16),
                child: Row(
                  children: [
                    Icon(
                      arabicFont == ArabicFontOption.scheherazadeNew
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      size: 18,
                      color: arabicFont == ArabicFontOption.scheherazadeNew
                          ? theme.colorScheme.primary
                          : null,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Scheherazade New',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: arabicFont == ArabicFontOption.scheherazadeNew
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'font_kufi',
                height: 36,
                padding: const EdgeInsets.only(left: 48, right: 16),
                child: Row(
                  children: [
                    Icon(
                      arabicFont == ArabicFontOption.notoKufiArabic
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      size: 18,
                      color: arabicFont == ArabicFontOption.notoKufiArabic
                          ? theme.colorScheme.primary
                          : null,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Noto Kufi Arabic',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: arabicFont == ArabicFontOption.notoKufiArabic
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                value: 'translation',
                child: Row(
                  children: [
                    Icon(
                      _showTranslation ? Icons.check_box : Icons.check_box_outline_blank,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    const Text('Tampilin arti bahasa'),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                value: 'font_up',
                child: Row(
                  children: const [
                    Icon(Icons.text_increase, size: 20),
                    SizedBox(width: 8),
                    Text('Huruf lebih besar'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'font_down',
                child: Row(
                  children: const [
                    Icon(Icons.text_decrease, size: 20),
                    SizedBox(width: 8),
                    Text('Huruf lebih kecil'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Section indicator
          if (manaqib.sections.length > 1)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  manaqib.sections.length,
                  (i) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i == _currentSectionIndex
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurface.withValues(alpha: 0.2),
                    ),
                  ),
                ),
              ),
            ),

          // Content
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: manaqib.sections.length,
              onPageChanged: (index) {
                setState(() => _currentSectionIndex = index);
              },
              itemBuilder: (context, index) {
                final section = manaqib.sections[index];
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Section title
                      if (manaqib.sections.length > 1) ...[
                        Text(
                          section.title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Arabic text
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: theme.colorScheme.primary.withValues(alpha: 0.1),
                          ),
                        ),
                        child: Text(
                          section.arabicText,
                          textAlign: TextAlign.center,
                          style: arabicFont.textStyle(
                            fontSize: _fontSize,
                            height: 2.2,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ),

                      if (_showLatin && section.latinText != null) ...[
                        const SizedBox(height: 20),
                        Text(
                          section.latinText!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: _fontSize - 6,
                            fontStyle: FontStyle.italic,
                            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                            height: 1.8,
                          ),
                        ),
                      ],

                      if (_showTranslation) ...[
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            section.translation,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: _fontSize - 6,
                              color: theme.colorScheme.onSurface,
                              height: 1.8,
                            ),
                          ),
                        ),
                      ],

                      const SizedBox(height: 40),

                      // Page indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${index + 1}',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          Text(
                            ' dari ${manaqib.sections.length} bagian',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                            ),
                          ),
                        ],
                      ),
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
}
