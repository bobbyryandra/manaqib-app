class Manaqib {
  final int id;
  final String title;
  final String arabicTitle;
  final String description;
  final String category;
  final String source;
  final String? validityNote;
  final List<ManaqibSection> sections;

  const Manaqib({
    required this.id,
    required this.title,
    required this.arabicTitle,
    required this.description,
    required this.category,
    this.source = '',
    this.validityNote,
    required this.sections,
  });
}

class ManaqibSection {
  final String title;
  final String arabicText;
  final String translation;
  final String? latinText;
  final String? sourceNote;

  const ManaqibSection({
    required this.title,
    required this.arabicText,
    required this.translation,
    this.latinText,
    this.sourceNote,
  });
}
