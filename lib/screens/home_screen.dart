import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';
import '../data/manaqib_content.dart';
import '../services/bookmark_provider.dart';

class CategoryInfo {
  final String name;
  final String emoji;
  final String description;

  const CategoryInfo(this.name, this.emoji, this.description);
}

const _categories = {
  'Shalawat': CategoryInfo('Shalawat', '🤲', 'Pujian & doa untuk Nabi Muhammad SAW'),
  'Dzikir': CategoryInfo('Dzikir', '📿', 'Zikir pagi, petang, & sehari-hari'),
  'Doa': CategoryInfo('Doa', '🤲', 'Doa pilihan setelah shalat & harian'),
};

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarkProvider = context.watch<BookmarkProvider>();
    final theme = Theme.of(context);
    final arabicFont = context.watch<ThemeProvider>().arabicFontOption;
    final categories = <String>{...manaqibList.map((m) => m.category)}.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manaqib'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '🤲',
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await bookmarkProvider.loadBookmarks();
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Header card
            Card(
              elevation: 0,
              color: theme.colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                    '📖 Bacaan Doa & Dzikir',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Kumpulan shalawat, dzikir, & doa sehari-hari',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Masjid Darussa\'adah',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.6),
                    ),
                  ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.menu_book_rounded,
                          size: 18,
                          color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.7),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${manaqibList.length} Bacaan Tersedia',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.7),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.bookmark_rounded,
                          size: 18,
                          color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.7),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${bookmarkProvider.count} Tersimpan',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Category sections
            for (final category in categories) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Text(
                      _categories[category]?.emoji ?? '📖',
                      style: const TextStyle(fontSize: 22),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _categories[category]?.description ?? '',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ...manaqibList
                  .where((m) => m.category == category)
                  .map(
                    (manaqib) => Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () => context.push('/reading/${manaqib.id}'),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      manaqib.title,
                                      style: theme.textTheme.titleSmall?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      manaqib.arabicTitle,
                                      style: arabicFont.textStyle(
                                        color: theme.colorScheme.primary,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      manaqib.description,
                                      style: theme.textTheme.bodySmall?.copyWith(
                                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              if (bookmarkProvider.isBookmarked(manaqib.id))
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Icon(
                                    Icons.bookmark,
                                    color: theme.colorScheme.primary,
                                    size: 20,
                                  ),
                                ),
                              Icon(
                                Icons.chevron_right,
                                color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              const SizedBox(height: 8),
            ],
          ],
        ),
      ),
    );
  }
}
