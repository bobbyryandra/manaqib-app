import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../data/manaqib_content.dart';
import '../models/manaqib.dart';
import '../theme/theme_data.dart';
import '../theme/theme_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  String _query = '';
  final _focusNode = FocusNode();

  // Category color map for consistent styling
  static const _categoryColors = {
    'Shalawat': Color(0xFF1A6B5A),
    'Dzikir': Color(0xFF5BA4CF),
    'Doa': Color(0xFFD4A843),
    'Tawasul': Color(0xFF8B5E3C),
    'Maulid & Qasidah': Color(0xFF7B4BAF),
  };

  Color _categoryColor(String category) =>
      _categoryColors[category] ?? AppColors.primary;

  List<MapEntry<int, Manaqib>> get _results {
    if (_query.isEmpty) return const [];
    final q = _query.toLowerCase();
    return allManaqibList
        .asMap()
        .entries
        .where((entry) {
          final m = entry.value;
          return m.title.toLowerCase().contains(q) ||
              m.arabicTitle.contains(q) ||
              m.description.toLowerCase().contains(q) ||
              m.category.toLowerCase().contains(q) ||
              m.sections.any(
                (s) =>
                    s.arabicText.contains(q) ||
                    s.translation.toLowerCase().contains(q) ||
                    (s.latinText?.toLowerCase().contains(q) ?? false),
              );
        })
        .toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final arabicFont = context.watch<ThemeProvider>().arabicFontOption;
    final isDark = theme.brightness == Brightness.dark;
    final results = _results;

    return Scaffold(
      // Transparent appbar — search bar sits below
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.search, size: 22, color: AppColors.gold),
            const SizedBox(width: 8),
            Text(
              'Cari Bacaan',
              style: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.w700,
                color: isDark ? AppColors.gold : Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ✨ Prominent search bar — card style, sits on surface
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurfaceVariant : AppColors.lightSurface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Icon(
                    Icons.search_rounded,
                    color: AppColors.primary.withValues(alpha: 0.5),
                    size: 22,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      focusNode: _focusNode,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Judul, latin, atau arti...',
                        hintStyle: TextStyle(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.35),
                          fontSize: 15,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      style: const TextStyle(fontSize: 15),
                      onChanged: (value) => setState(() => _query = value),
                    ),
                  ),
                  if (_query.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        _searchController.clear();
                        _focusNode.requestFocus();
                        setState(() => _query = '');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.close_rounded,
                          size: 18,
                          color: AppColors.primary.withValues(alpha: 0.7),
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 24),
                ],
              ),
            ),
          ),

          // Content area
          Expanded(
            child: _query.isEmpty
                ? _EmptyState(isDark: isDark, theme: theme)
                : results.isEmpty
                    ? _NoResultsState(query: _query, theme: theme)
                    : _buildResults(results, theme, arabicFont, isDark),
          ),
        ],
      ),
    );
  }

  Widget _buildResults(
    List<MapEntry<int, Manaqib>> results,
    ThemeData theme,
    ArabicFontOption arabicFont,
    bool isDark,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final manaqib = results[index].value;
        final catColor = _categoryColor(manaqib.category);

        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: 0.4),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.15 : 0.03),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => context.push('/reading/${manaqib.id}'),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // Left accent bar
                    Container(
                      width: 4,
                      height: 48,
                      decoration: BoxDecoration(
                        color: catColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Category badge + sections count
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: catColor.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  manaqib.category,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: catColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${manaqib.sections.length} bagian',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: theme.colorScheme.onSurface
                                      .withValues(alpha: 0.35),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            manaqib.title,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            manaqib.arabicTitle,
                            style: arabicFont.textStyle(
                              color: AppColors.primaryLight,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.chevron_right,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// ─── Empty State ─────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  final bool isDark;
  final ThemeData theme;

  const _EmptyState({required this.isDark, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Search icon with decorative container
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.12),
                ),
              ),
              child: Icon(
                Icons.search_rounded,
                size: 40,
                color: AppColors.primary.withValues(alpha: 0.4),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Cari Bacaan',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Ketik judul bacaan, teks latin,\natau arti bahasa Indonesia',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.35),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── No Results State ────────────────────────────────────────────────

class _NoResultsState extends StatelessWidget {
  final String query;
  final ThemeData theme;

  const _NoResultsState({required this.query, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.08),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.orange.withValues(alpha: 0.12),
                ),
              ),
              child: Icon(
                Icons.search_off_rounded,
                size: 40,
                color: Colors.orange.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Tidak Ditemukan',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Gak ketemu yang cocok untuk\n"$query"',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.35),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Coba pake kata kunci lain atau lebih pendek',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
