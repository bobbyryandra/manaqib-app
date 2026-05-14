import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/theme_provider.dart';
import 'services/bookmark_provider.dart';
import 'router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => BookmarkProvider()),
      ],
      child: const ManaqibApp(),
    ),
  );
}

class ManaqibApp extends StatelessWidget {
  const ManaqibApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp.router(
      title: 'Manaqib - Masjid Darussa\'adah',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF1B7A3D),
        brightness: Brightness.light,
        fontFamily: 'Inter',
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF1B7A3D),
        brightness: Brightness.dark,
        fontFamily: 'Inter',
      ),
      themeMode: themeProvider.themeMode,
      routerConfig: AppRouter.router,
    );
  }
}
