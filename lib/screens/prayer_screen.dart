import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/prayer_times_service.dart';
import '../theme/theme_data.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key});

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  final _service = PrayerTimesService();
  PrayerSchedule? _schedule;
  bool _loading = true;
  String? _error;
  String _selectedCity = 'Jakarta';

  @override
  void initState() {
    super.initState();
    _loadPrayerTimes();
  }

  Future<void> _loadPrayerTimes() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      await _service.initLocation();
      if (_service.selectedCity != null) {
        _selectedCity = _service.selectedCity!;
      }
      final schedule = await _service.getTodayPrayerTimes();
      if (mounted) {
        setState(() {
          _schedule = schedule;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'Gagal memuat jadwal: $e';
          _loading = false;
        });
      }
    }
  }

  void _changeCity(String city) {
    setState(() {
      _selectedCity = city;
      _loading = true;
    });
    _service.setCity(city);
    _loadPrayerTimes();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.access_time_rounded, size: 22, color: AppColors.gold),
            const SizedBox(width: 8),
            Text(
              'Jadwal Sholat',
              style: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.w700,
                color: isDark ? AppColors.gold : Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          // City selector
          PopupMenuButton<String>(
            icon: Icon(
              Icons.location_on_outlined,
              color: isDark ? AppColors.gold : Colors.white,
              size: 20,
            ),
            onSelected: _changeCity,
            itemBuilder: (context) => _service.availableCities.map((city) {
              final isSelected = city == _selectedCity;
              return PopupMenuItem(
                value: city,
                child: Row(
                  children: [
                    Icon(
                      isSelected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      size: 16,
                      color: isSelected ? AppColors.primary : null,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      city,
                      style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),

      body: _buildBody(theme, isDark),
    );
  }

  Widget _buildBody(ThemeData theme, bool isDark) {
    if (_loading && _schedule == null) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: AppColors.gold),
            SizedBox(height: 16),
            Text('Memuat jadwal sholat...',
                style: TextStyle(color: AppColors.gold)),
          ],
        ),
      );
    }

    if (_error != null && _schedule == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.cloud_off, size: 64,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.2)),
              const SizedBox(height: 16),
              Text(_error!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.5))),
            ],
          ),
        ),
      );
    }

    final schedule = _schedule!;
    final nextPrayer = schedule.nextPrayer;
    final allPassed = schedule.allPassed;

    return RefreshIndicator(
      onRefresh: _loadPrayerTimes,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 8),

          // Header card
          _HeaderCard(
            schedule: schedule,
            isDark: isDark,
            city: _selectedCity,
          ),
          const SizedBox(height: 12),

          // Next prayer highlight (hide when all prayers are done)
          if (nextPrayer != null && !allPassed) ...[
            _NextPrayerCard(prayer: nextPrayer, schedule: schedule),
            const SizedBox(height: 16),
          ],

          // All passed banner
          if (allPassed) ...[
            _AllDoneCard(),
            const SizedBox(height: 16),
          ],

          // Prayer timeline
          ...schedule.prayers.map((p) => _PrayerTimelineTile(
                prayer: p,
                theme: theme,
                isDark: isDark,
                isNext: p == nextPrayer,
              )),

          const SizedBox(height: 90),
        ],
      ),
    );
  }
}

// ─── Header Card ─────────────────────────────────────────────────────

class _HeaderCard extends StatelessWidget {
  final PrayerSchedule schedule;
  final bool isDark;
  final String city;

  const _HeaderCard({
    required this.schedule,
    required this.isDark,
    required this.city,
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
                Row(
                  children: [
                    Text(
                      '🕌',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            schedule.date,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            schedule.hijriDate,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.location_on_rounded,
                      size: 16,
                      color: Colors.white.withValues(alpha: 0.6),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      city.length > 8 ? '${city.substring(0, 8)}..' : city,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Stats row (matching home screen style)
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
                        icon: Icons.access_time_rounded,
                        label: '${schedule.prayers.length} Waktu',
                        color: AppColors.gold,
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 1,
                        height: 24,
                        color: Colors.white.withValues(alpha: 0.15),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'InsyaaAllah akurat ± 2 menit · Sumber: Aladhan.com',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white.withValues(alpha: 0.5),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
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

// ─── Stat Chip (matching home screen) ───────────────────────────────

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

// ─── Next Prayer Card ─────────────────────────────────────────────────

class _NextPrayerCard extends StatelessWidget {
  final PrayerTimeData prayer;
  final PrayerSchedule schedule;

  const _NextPrayerCard({
    required this.prayer,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    final info = schedule.nextPrayerInfo;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.gold.withValues(alpha: 0.15),
            AppColors.gold.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.gold.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.gold.withValues(alpha: 0.2),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.gold.withValues(alpha: 0.4),
              ),
            ),
            child: Center(
              child: Text(
                prayer.arabicName,
                style: const TextStyle(fontSize: 20, color: AppColors.gold),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sholat Selanjutnya',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.gold.withValues(alpha: 0.7),
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  prayer.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.gold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  info?.remainingStr ?? prayer.timeStr,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.gold.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          Text(
            prayer.timeStr,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: AppColors.gold,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── All Done Card ────────────────────────────────────────────────

class _AllDoneCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.primary.withValues(alpha: 0.15)
            : AppColors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.nights_stay_rounded,
              size: 32, color: AppColors.primary),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Semua sholat hari ini telah selesai',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Semoga amal ibadah kita diterima Allah SWT',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.5),
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

// ─── Prayer Timeline Tile ────────────────────────────────────────────

class _PrayerTimelineTile extends StatelessWidget {
  final PrayerTimeData prayer;
  final ThemeData theme;
  final bool isDark;
  final bool isNext;

  const _PrayerTimelineTile({
    required this.prayer,
    required this.theme,
    required this.isDark,
    required this.isNext,
  });

  @override
  Widget build(BuildContext context) {
    final passed = prayer.isPassed;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: isNext
            ? AppColors.gold.withValues(alpha: isDark ? 0.12 : 0.08)
            : (isDark ? AppColors.darkSurface : AppColors.lightSurface),
        borderRadius: BorderRadius.circular(14),
        border: isNext
            ? Border.all(color: AppColors.gold.withValues(alpha: 0.3))
            : Border.all(
                color: theme.colorScheme.outline.withValues(alpha: 0.3)),
        boxShadow: isNext
            ? [
                BoxShadow(
                  color: AppColors.gold.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                )
              ]
            : null,
      ),
      child: Row(
        children: [
          // Arabic name circle
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: passed
                  ? AppColors.primary.withValues(alpha: 0.1)
                  : (isNext
                      ? AppColors.gold.withValues(alpha: 0.2)
                      : AppColors.skyBlue.withValues(alpha: 0.15)),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                prayer.arabicName,
                style: TextStyle(
                  fontSize: 16,
                  color: passed
                      ? AppColors.primary.withValues(alpha: 0.5)
                      : (isNext ? AppColors.gold : AppColors.skyBlue),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      prayer.name,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: isNext ? FontWeight.w700 : FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    if (passed) ...[
                      const SizedBox(width: 8),
                      Icon(
                        Icons.check_circle,
                        size: 16,
                        color: AppColors.primary.withValues(alpha: 0.5),
                      ),
                    ],
                  ],
                ),
                Text(
                  prayer.period,
                  style: TextStyle(
                    fontSize: 11,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                prayer.timeStr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: isNext
                      ? AppColors.gold
                      : theme.colorScheme.onSurface,
                ),
              ),
              if (isNext)
                Text(
                  'segera',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.gold.withValues(alpha: 0.8),
                    letterSpacing: 0.5,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
