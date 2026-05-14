import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/theme_data.dart';

class DisclaimerScreen extends StatelessWidget {
  const DisclaimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.gavel_rounded, size: 22, color: AppColors.gold),
            const SizedBox(width: 8),
            Text(
              'Sumber & Disclaimer',
              style: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.w700,
                color: isDark ? AppColors.gold : Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Header
          Card(
            elevation: 0,
            color: theme.colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text('🕌', style: TextStyle(fontSize: 40)),
                  const SizedBox(height: 12),
                  Text(
                    'Sumber Konten & Disclaimer',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Aplikasi Manaqib — Masjid Darussa\'adah',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer
                          .withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Sumber Konten Al-Quran
          _buildSection(
            context,
            icon: Icons.menu_book,
            title: '📖 Sumber Konten Al-Quran',
            items: [
              'Teks Arab: Mushaf Utsmani (King Fahad Complex)',
              'Terjemahan: Kemenag RI',
              'Transliterasi: Standar Unicode Arabic',
              'API: alquran.cloud — tervalidasi Sanad',
            ],
            note:
                'Semua ayat Al-Quran menggunakan standar penulisan Mushaf Utsmani. Harakat dan tanda baca mengikuti cetakan resmi King Fahad Glorious Quran Printing Complex, Madinah.',
          ),
          const SizedBox(height: 16),

          // Sumber Shalawat
          _buildSection(
            context,
            icon: Icons.favorite,
            title: '🤲 Sumber Shalawat',
            items: [
              'Shalawat Badar — Kitab Al-Majmu\' Al-Wardiyah',
              'Shalawat Munjiyat — Kitab Dalailul Khairat',
              'Shalawat Nariyah — Kitab Al-Ibriz',
              'Shalawat Fatih — Kitab Dalailul Khairat',
            ],
            note:
                'Shalawat-shalawat ini bersumber dari kitab-kitab yang diriwayatkan oleh para ulama besar. Penulisan latin menggunakan metode transliterasi standar yang umum di Indonesia.',
          ),
          const SizedBox(height: 16),

          // Sumber Dzikir & Doa
          _buildSection(
            context,
            icon: Icons.nightlight_round,
            title: '📿 Sumber Dzikir & Doa',
            items: [
              'Dzikir Pagi/Petang — Kitab Al-Adzkar (Imam An-Nawawi)',
              'Doa Setelah Shalat — HR. Bukhari & Muslim',
              'Tahlil, Takbir, Tasbih — Hadits Shahih Bukhari Muslim',
            ],
            note:
                'Semua dzikir dan doa dikutip dari kitab Al-Adzkar karya Imam An-Nawawi (w. 676 H) yang merangkum hadits-hadits shahih. Nomor hadits merujuk pada kitab Shahih Bukhari dan Shahih Muslim.',
          ),
          const SizedBox(height: 16),

          // Sumber Waktu Sholat
          _buildSection(
            context,
            icon: Icons.access_time_rounded,
            title: '🕌 Sumber Jadwal Sholat',
            items: [
              'API Aladhan.com — Islamic Prayer Times',
              'Metode perhitungan: Umm Al-Qura (Makkah)',
              '12 kota Indonesia built-in',
              'GPS auto-detect — Geolocator plugin',
              'Fallback estimasi khatulistiwa (offline)',
              'Cache per-hari untuk mengurangi API call',
            ],
            note:
                'Jadwal sholat diambil dari API Aladhan.com yang merupakan penyedia jadwal sholat Islam gratis dan terpercaya. Metode perhitungan default menggunakan standar Umm Al-Qura University, Makkah. Akurasi ± 2 menit. Untuk lokasi yang tidak terdeteksi, default ke Jakarta. Semua waktu bersifat estimasi — selalu konfirmasi dengan jadwal resmi masjid setempat.',
          ),
          const SizedBox(height: 16),

          // Sumber Tawasul
          _buildSection(
            context,
            icon: Icons.mosque,
            title: '🕌 Sumber Bacaan Tawasul',
            items: [
              'Tawasul — bacaan pembuka sebelum Manaqib',
              'Tradisi Thoriqoh Qodiriyyah — Syekh Abdul Qadir Al-Jailani',
              'Shalawat pengantar bersumber dari kitab Dalailul Khairat',
              'Tawasul melalui Nabi & para ulama salaf',
              'Konsep tawasul berdasarkan Al-Quran (QS. Al-Ma\'idah: 35)',
              'Shalawat Munjiyat — Imam Al-Jazuli, Dalailul Khairat',
              'Doa Rabbanaa — Al-Quran Surah Al-Baqarah: 201',
              'Penutup shalawat — HR. Tirmidzi',
            ],
            note:
                'Bacaan Tawasul ini merupakan tradisi yang umum dibaca oleh jamaah manaqib sebelum membaca Manaqib Syekh Abdul Qadir Al-Jailani (w. 561 H/1166 M). Syekh Abdul Qadir Al-Jailani adalah pendiri Thoriqoh Qodiriyyah, salah satu thoriqoh terbesar dalam Islam. Konsep tawasul (mengambil perantara) kepada Allah melalui Nabi, para ulama, dan amal saleh merupakan hal yang dibenarkan oleh mayoritas ulama, sebagaimana ditunjukkan oleh dalil dari Al-Quran, Sunnah, dan amalan para sahabat.',
          ),
          const SizedBox(height: 16),

          // Sumber Manaqib Syekh Abdul Qadir Al-Jailani
          _buildSection(
            context,
            icon: Icons.auto_stories,
            title: '📖 Sumber Manaqib Syekh Abdul Qadir Al-Jailani',
            items: [
              'Kitab Al-Fuyudhat Ar-Rabbaniyyah — Syekh Abdul Qadir Al-Jailani',
              'Kitab Futuh Al-Ghaib — Syekh Abdul Qadir Al-Jailani',
              'Thoriqoh Qodiriyyah — didirikan w. 561 H/1166 M di Baghdad',
              'Pujian kepada Allah (hamdalah, naat, dzikir)',
              'Shalawat kepada Nabi Muhammad SAW (madih)',
              'Sanjungan kepada Syekh Abdul Qadir Al-Jailani (Quthb Aulia)',
              'Istighfar Agung — HR. Bukhari no. 6307, Muslim no. 2702',
              'Doa penolak bala — HR. Abu Dawud no. 1556, Tirmidzi no. 3388',
              'Doa Rabbanaa — Al-Quran Surah Al-Ma\'idah: 114, Al-Baqarah: 201',
              'Penutup — Surah Ash-Shaffat ayat 180-182',
              'Shalawat penutup — pola bilangan tak terhingga',
            ],
            note:
                'Manaqib Syekh Abdul Qadir Al-Jailani (470-561 H/1077-1166 M) adalah bacaan yang umum dibaca di majelis-majelis dzikir di Indonesia, khususnya oleh pengikut Thoriqoh Qodiriyyah. Syekh Abdul Qadir lahir di Jailan (Kurdistan) dan wafat di Baghdad. Beliau dikenal sebagai Quthb Aulia (Kutub Para Wali) dan termasuk ulama besar yang memiliki banyak murid dari berbagai penjuru dunia Islam. Teks manaqib yang dibaca di berbagai majelis merupakan kumpulan dari nasihat-nasihat beliau dalam kitab Al-Fuyudhat Ar-Rabbaniyyah (Karunia-karunia Ilahi) dan Futuh Al-Ghaib (Pembukaan Ghaib) yang kemudian disusun menjadi nadzam (syair) oleh para ulama pengikut beliau.',
          ),
          const SizedBox(height: 16),

          // Sumber Teks Latin
          _buildSection(
            context,
            icon: Icons.translate,
            title: '🔤 Ketentuan Teks Latin',
            items: [
              'Menggunakan standar transliterasi MUI',
              'Huruf "sy" untuk ش, "kh" untuk خ',
              'Huruf "dh" untuk ذ, "gh" untuk غ',
              'Panjang pendek vokal disesuaikan bacaan umum',
            ],
            note:
                'Penulisan latin hanya sebagai panduan bacaan. Untuk bacaan yang benar, ikuti harakat pada teks Arab atau pelajari langsung dari guru/pengajar.',
          ),
          const SizedBox(height: 16),

          // Validasi & Keterbatasan
          _buildSection(
            context,
            icon: Icons.warning_amber_rounded,
            title: '⚠️ Validasi & Keterbatasan',
            items: [
              'Konten sudah melalui pengecekan ulang',
              'Kemungkinan ada perbedaan harakat minor',
              'Teks latin bersifat transliterasi, bukan phonetic',
              'Tidak menggantikan belajar dari ulama/guru',
            ],
            note:
                'Meskipun sudah berusaha akurat, aplikasi ini mungkin terdapat kesalahan minor. Kami terbuka untuk koreksi. Hubungi pengelola masjid untuk menyampaikan perbaikan.',
            warningColor: theme.colorScheme.error,
          ),
          const SizedBox(height: 16),

          // Referensi UI/UX Design
          _buildSection(
            context,
            icon: Icons.palette,
            title: '🎨 Referensi Desain UI/UX',
            items: [
              'Material Design 3 (Google, 2024)',
              'Islamic Geometric Patterns — modernisasi',
              'Naskh font family — standar tipografi Islam',
              'Color palette: Hijau Emerald + Gold + Neutral',
              'Card-based layout dengan soft shadow',
              'Bottom navigation — mobile-first approach',
              'Dark mode support — aksesibilitas baca malam',
              'Arabic right-to-left (RTL) compatible',
              'Modern Islamic UI Trends 2025-2026',
              'Whitespace-heavy, minimal, clean aesthetic',
            ],
            note:
                'Desain mengikuti tren Modern Islamic UI 2026: bersih, minimal, dengan sentuhan ornamen Islam yang halus. Tipografi Arab menggunakan Google Fonts Naskh family. Referensi: Dribbble Islamic UI, Behance Muslim App Design, Material Design Guidelines.',
          ),
          const SizedBox(height: 16),

          // Tech Stack
          _buildSection(
            context,
            icon: Icons.code,
            title: '⚙️ Teknologi',
            items: [
              'Flutter 3.x — Cross-platform framework',
              'Dart — Programming language',
              'Google Fonts — Typography service',
              'Provider — State management',
              'GoRouter — Declarative routing',
              'Geolocator — GPS location',
              'SharedPreferences — Local storage',
            ],
            note:
                'Aplikasi dibangun menggunakan Flutter untuk mendukung Android, iOS, dan Web dari satu codebase.',
          ),
          const SizedBox(height: 32),

          // Disclaimer resmi
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: theme.colorScheme.outline.withValues(alpha: 0.3),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.gavel,
                      size: 20,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Disclaimer Resmi',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Aplikasi ini dibuat sebagai sarana memudahkan jamaah '
                  'Masjid Darussa\'adah dalam membaca shalawat, dzikir, '
                  'dan doa sehari-hari. Konten yang ditampilkan bersumber '
                  'dari kitab-kitab dan hadits yang terpercaya.\n\n'
                  'Aplikasi ini BUKAN pengganti:\n'
                  '• Belajar langsung dari ulama/guru\n'
                  '• Kitab asli dalam bentuk cetak\n'
                  '• Konsultasi fiqih dengan orang yang berkompeten\n\n'
                  'Apabila ditemukan kesalahan dalam penulisan harakat, '
                  'terjemahan, atau konten lainnya, silakan sampaikan '
                  'kepada pengelola Masjid Darussa\'adah.\n\n'
                  'Semoga bermanfaat. بارك الله فيكم',
                  style: theme.textTheme.bodySmall?.copyWith(
                    height: 1.8,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Version
          Center(
            child: Text(
              'Versi 1.0.0 • Masjid Darussa\'adah • 2026',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required IconData icon,
    required String title,
    required List<String> items,
    required String note,
    Color? warningColor,
  }) {
    final theme = Theme.of(context);
    final color = warningColor ?? theme.colorScheme.primary;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 22),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '•',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface
                            .withValues(alpha: 0.5),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        item,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: color.withValues(alpha: 0.15),
                ),
              ),
              child: Text(
                note,
                style: theme.textTheme.bodySmall?.copyWith(
                  height: 1.7,
                  fontStyle: FontStyle.italic,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
