import 'package:flutter_test/flutter_test.dart';
import 'package:manaqib_app/data/manaqib_content.dart';

void main() {
  test('manaqib list should not be empty', () {
    expect(manaqibList.isNotEmpty, true);
  });

  test('each manaqib should have valid sections', () {
    for (final manaqib in manaqibList) {
      expect(manaqib.id, greaterThan(0));
      expect(manaqib.title, isNotEmpty);
      expect(manaqib.sections, isNotEmpty);
      for (final section in manaqib.sections) {
        expect(section.arabicText, isNotEmpty);
        expect(section.translation, isNotEmpty);
      }
    }
  });
}
