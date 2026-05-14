import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Setelan'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // App info
          Card(
            elevation: 0,
            color: theme.colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    '🕌',
                    style: TextStyle(fontSize: 48),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Manaqib App',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Masjid Darussa\'adah',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Versi 1.0.0',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Theme settings
          Text(
            'Tampilan Layar',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                RadioListTile<ThemeModeOption>(
                  title: const Text('Ikuti HP'),
                  subtitle: const Text('Bakal otomatis nyala gelap kalau HP lo set gelap'),
                  value: ThemeModeOption.system,
                  groupValue: themeProvider.themeModeOption,
                  onChanged: (value) {
                    if (value != null) themeProvider.setThemeMode(value);
                  },
                ),
                const Divider(height: 1),
                RadioListTile<ThemeModeOption>(
                  title: const Text('Selalu Terang'),
                  subtitle: const Text('Tampilan putih, cocok buat siang hari'),
                  value: ThemeModeOption.light,
                  groupValue: themeProvider.themeModeOption,
                  onChanged: (value) {
                    if (value != null) themeProvider.setThemeMode(value);
                  },
                ),
                const Divider(height: 1),
                RadioListTile<ThemeModeOption>(
                  title: const Text('Selalu Gelap'),
                  subtitle: const Text('Tampilan hitam, nyaman buat baca malam'),
                  value: ThemeModeOption.dark,
                  groupValue: themeProvider.themeModeOption,
                  onChanged: (value) {
                    if (value != null) themeProvider.setThemeMode(value);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Arabic font settings
          Text(
            'Font Teks Arab',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Pilih gaya huruf arab yang nyaman buat dibaca',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: ArabicFontOption.values.map((font) {
                final isSelected = themeProvider.arabicFontOption == font;
                return Column(
                  children: [
                    RadioListTile<ArabicFontOption>(
                      title: Text(
                        font.label,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      subtitle: Text(
                        font.description,
                        style: TextStyle(
                          color: isSelected
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                      secondary: Text(
                        'بِسْمِ اللّٰهِ',
                        style: font.textStyle(
                          fontSize: 16,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      value: font,
                      groupValue: themeProvider.arabicFontOption,
                      onChanged: (value) {
                        if (value != null) themeProvider.setArabicFont(value);
                      },
                    ),
                    if (font != ArabicFontOption.values.last)
                      const Divider(height: 1),
                  ],
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),

          // About
          Text(
            'Info Aplikasi',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.mosque_outlined),
                  title: const Text('Masjid Darussa\'adah'),
                  subtitle: const Text('Pusat kegiatan ibadah & pembelajaran'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('Tentang Aplikasi Ini'),
                  subtitle: const Text(
                    'Dibikin biar jamaah gampang baca shalawat, '
                    'dzikir, sama doa sehari-hari langsung dari HP.',
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.favorite_outline),
                  title: const Text('Dibuat dengan ❤️'),
                  subtitle: const Text('Untuk kebaikan umat'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.gavel_outlined),
                  title: const Text('Sumber & Disclaimer'),
                  subtitle: const Text(
                    'Referensi konten, validasi, & desain',
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.push('/disclaimer'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
