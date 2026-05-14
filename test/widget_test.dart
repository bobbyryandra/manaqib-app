import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:manaqib_app/main.dart';
import 'package:manaqib_app/theme/theme_provider.dart';
import 'package:manaqib_app/services/bookmark_provider.dart';

void main() {
  testWidgets('App renders splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => BookmarkProvider()),
        ],
        child: const ManaqibApp(),
      ),
    );

    // Advance animation so splash content renders
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // Verify splash screen shows key text
    expect(find.text('Manaqib'), findsOneWidget);
    expect(find.text('Mulai Membaca'), findsOneWidget);
  });
}
