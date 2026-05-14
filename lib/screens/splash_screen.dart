import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../theme/theme_data.dart';

/// Splash/Onboarding screen with Islamic design
/// Deep emerald gradient, mosque silhouette, geometric patterns, lanterns
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // Staggered animations
  late final AnimationController _mainController;
  late final Animation<double> _fadeLogo;
  late final Animation<double> _fadeTitle;
  late final Animation<double> _fadeSubtitle;
  late final Animation<double> _fadePattern;
  late final Animation<double> _fadeButton;
  late final Animation<double> _scaleLogo;

  @override
  void initState() {
    super.initState();

    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    );

    // Staggered intervals
    _fadeLogo = CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
    );
    _scaleLogo = CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.0, 0.5, curve: Curves.easeOutBack),
    );
    _fadeTitle = CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.25, 0.55, curve: Curves.easeOut),
    );
    _fadeSubtitle = CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.4, 0.65, curve: Curves.easeOut),
    );
    _fadePattern = CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.2, 0.6, curve: Curves.easeOut),
    );
    _fadeButton = CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.65, 0.85, curve: Curves.easeOut),
    );

    _mainController.forward();
  }

  @override
  void dispose() {
    _mainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0D4B3F), // primary
              Color(0xFF083329), // primaryDark
              Color(0xFF041A14), // near black emerald
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Background geometric pattern
              Positioned.fill(
                child: FadeTransition(
                  opacity: _fadePattern,
                  child: CustomPaint(
                    painter: _SplashPatternPainter(),
                  ),
                ),
              ),

              // Decorative lanterns (top left & top right)
              Positioned(
                top: 20,
                left: 16,
                child: FadeTransition(
                  opacity: _fadePattern,
                  child: const _Lantern(size: 50),
                ),
              ),
              Positioned(
                top: 12,
                right: 24,
                child: FadeTransition(
                  opacity: _fadePattern,
                  child: Transform.scale(
                    scale: 0.7,
                    child: const _Lantern(size: 50),
                  ),
                ),
              ),

              // Decorative crescent moon
              Positioned(
                top: 24,
                right: 60,
                child: FadeTransition(
                  opacity: _fadePattern,
                  child: _CrescentMoon(
                    size: 28,
                    color: AppColors.gold.withValues(alpha: 0.3),
                  ),
                ),
              ),

              // Stars scattered
              Positioned(
                top: 60,
                left: 40,
                child: FadeTransition(
                  opacity: _fadePattern,
                  child: _Star(size: 8, color: AppColors.gold.withValues(alpha: 0.25)),
                ),
              ),
              Positioned(
                top: 40,
                left: 140,
                child: FadeTransition(
                  opacity: _fadePattern,
                  child: _Star(size: 6, color: AppColors.gold.withValues(alpha: 0.2)),
                ),
              ),
              Positioned(
                top: 80,
                right: 100,
                child: FadeTransition(
                  opacity: _fadePattern,
                  child: _Star(size: 5, color: AppColors.gold.withValues(alpha: 0.2)),
                ),
              ),

              // Main content
              Column(
                children: [
                  const Spacer(flex: 2),

                  // Logo
                  ScaleTransition(
                    scale: _scaleLogo,
                    child: FadeTransition(
                      opacity: _fadeLogo,
                      child: Hero(
                        tag: 'mosque_logo',
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withValues(alpha: 0.08),
                            border: Border.all(
                              color: AppColors.gold.withValues(alpha: 0.4),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.gold.withValues(alpha: 0.15),
                                blurRadius: 30,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              '🕌',
                              style: TextStyle(fontSize: 52),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // App name — Bismillah
                  FadeTransition(
                    opacity: _fadeTitle,
                    child: Column(
                      children: [
                        Text(
                          'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.amiri(
                            fontSize: 18,
                            color: AppColors.gold.withValues(alpha: 0.7),
                            height: 1.8,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Manaqib',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Masjid Darussa\'adah',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withValues(alpha: 0.6),
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(flex: 3),

                  // Decorative divider
                  FadeTransition(
                    opacity: _fadeSubtitle,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: AppColors.gold.withValues(alpha: 0.2),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: _Star(
                              size: 8,
                              color: AppColors.gold.withValues(alpha: 0.5),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: AppColors.gold.withValues(alpha: 0.2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Description
                  FadeTransition(
                    opacity: _fadeSubtitle,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Kumpulan shalawat, dzikir, dan doa sehari-hari\nuntuk jamaah Masjid Darussa\'adah',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white.withValues(alpha: 0.45),
                          height: 1.6,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Enter button
                  FadeTransition(
                    opacity: _fadeButton,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 20),
                        end: Offset.zero,
                      ).animate(_fadeButton),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48),
                        child: _EnterButton(
                          onTap: () {
                            context.go('/');
                          },
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 48),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Enter Button ────────────────────────────────────────────────────

class _EnterButton extends StatefulWidget {
  final VoidCallback onTap;

  const _EnterButton({required this.onTap});

  @override
  State<_EnterButton> createState() => _EnterButtonState();
}

class _EnterButtonState extends State<_EnterButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.gold,
              AppColors.goldLight,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.gold.withValues(alpha: _isPressed ? 0.2 : 0.35),
              blurRadius: _isPressed ? 8 : 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Mulai Membaca',
              style: GoogleFonts.playfairDisplay(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryDark,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(width: 10),
            Icon(
              Icons.arrow_forward_rounded,
              size: 20,
              color: AppColors.primaryDark.withValues(alpha: 0.7),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Decorative Lantern ──────────────────────────────────────────────

class _Lantern extends StatelessWidget {
  final double size;

  const _Lantern({required this.size});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size * 0.5, size),
      painter: _LanternPainter(),
    );
  }
}

class _LanternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const gold = AppColors.gold;

    // Hook at top
    final hookPaint = Paint()
      ..color = gold.withValues(alpha: 0.4)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    canvas.drawLine(
      Offset(size.width * 0.5, 0),
      Offset(size.width * 0.5, size.height * 0.12),
      hookPaint,
    );

    // Top cap
    final capPaint = Paint()..color = gold.withValues(alpha: 0.5);
    final capRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.15),
        width: size.width * 0.5,
        height: size.height * 0.04,
      ),
      const Radius.circular(2),
    );
    canvas.drawRRect(capRect, capPaint);

    // Body (rounded trapezoid)
    final bodyPaint = Paint()
      ..color = gold.withValues(alpha: 0.12)
      ..style = PaintingStyle.fill;
    final bodyPath = Path();
    bodyPath.moveTo(size.width * 0.25, size.height * 0.17);
    bodyPath.lineTo(size.width * 0.75, size.height * 0.17);
    bodyPath.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.45,
      size.width * 0.7,
      size.height * 0.72,
    );
    bodyPath.lineTo(size.width * 0.3, size.height * 0.72);
    bodyPath.quadraticBezierTo(
      size.width * 0.15,
      size.height * 0.45,
      size.width * 0.25,
      size.height * 0.17,
    );
    bodyPath.close();
    canvas.drawPath(bodyPath, bodyPaint);

    // Body outline
    final outlinePaint = Paint()
      ..color = gold.withValues(alpha: 0.35)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;
    canvas.drawPath(bodyPath, outlinePaint);

    // Bottom cap
    final bottomCapRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.74),
        width: size.width * 0.4,
        height: size.height * 0.03,
      ),
      const Radius.circular(2),
    );
    canvas.drawRRect(bottomCapRect, capPaint);

    // Tassel
    final tasselPaint = Paint()
      ..color = gold.withValues(alpha: 0.3)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    canvas.drawLine(
      Offset(size.width * 0.5, size.height * 0.76),
      Offset(size.width * 0.5, size.height * 0.92),
      tasselPaint,
    );
    // Tassel end
    canvas.drawLine(
      Offset(size.width * 0.4, size.height * 0.92),
      Offset(size.width * 0.6, size.height * 0.92),
      tasselPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─── Crescent Moon ───────────────────────────────────────────────────

class _CrescentMoon extends StatelessWidget {
  final double size;
  final Color color;

  const _CrescentMoon({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _CrescentPainter(color: color),
    );
  }
}

class _CrescentPainter extends CustomPainter {
  final Color color;

  _CrescentPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Outer arc
    final outerPath = Path();
    outerPath.addArc(
      Rect.fromCircle(center: Offset(size.width * 0.45, size.height * 0.5), radius: size.width * 0.4),
      -2.3,
      4.6,
    );
    canvas.drawPath(outerPath, paint);

    // Inner arc (creates crescent)
    final innerPath = Path();
    innerPath.addArc(
      Rect.fromCircle(center: Offset(size.width * 0.58, size.height * 0.5), radius: size.width * 0.32),
      -2.0,
      4.0,
    );
    canvas.drawPath(innerPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─── Star ────────────────────────────────────────────────────────────

class _Star extends StatelessWidget {
  final double size;
  final Color color;

  const _Star({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _StarPainter(color: color),
    );
  }
}

class _StarPainter extends CustomPainter {
  final Color color;

  _StarPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final r = size.width / 2;

    final path = Path();
    for (int i = 0; i < 10; i++) {
      final angle = (i * 36 - 90) * 3.14159265 / 180;
      final radius = i.isEven ? r : r * 0.4;
      final px = center.dx + radius * (angle.cos());
      final py = center.dy + radius * (angle.sin());
      if (i == 0) {
        path.moveTo(px, py);
      } else {
        path.lineTo(px, py);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

extension on double {
  double cos() => math.cos(this);
  double sin() => math.sin(this);
}

// ─── Splash Background Pattern ──────────────────────────────────────

class _SplashPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFFFFF).withValues(alpha: 0.04)
      ..strokeWidth = 0.8
      ..style = PaintingStyle.stroke;

    const spacing = 50.0;
    const outerR = 10.0;
    const innerR = 5.0;

    for (double x = -spacing; x < size.width + spacing; x += spacing) {
      for (double y = -spacing; y < size.height + spacing; y += spacing) {
        // 8-pointed star
        final path = Path();
        for (int i = 0; i < 16; i++) {
          final angle = (i * 22.5) * 3.14159265 / 180;
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
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─── Math import alias ───────────────────────────────────────────────

