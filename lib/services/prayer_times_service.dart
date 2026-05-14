import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

/// Data model for one prayer time
class PrayerTimeData {
  final String name;
  final String arabicName;
  final DateTime time;
  final bool isPassed;

  const PrayerTimeData({
    required this.name,
    required this.arabicName,
    required this.time,
    required this.isPassed,
  });

  String get timeStr {
    final h = time.hour.toString().padLeft(2, '0');
    final m = time.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  String get period {
    if (time.hour < 12) return 'Pagi';
    if (time.hour < 15) return 'Siang';
    if (time.hour < 18) return 'Sore';
    return 'Malam';
  }
}

/// Next prayer info
class NextPrayerInfo {
  final String name;
  final String arabicName;
  final DateTime time;
  final Duration remaining;

  const NextPrayerInfo({
    required this.name,
    required this.arabicName,
    required this.time,
    required this.remaining,
  });

  String get remainingStr {
    final h = remaining.inHours;
    final m = remaining.inMinutes % 60;
    if (h > 0) return '$h jam $m menit lagi';
    return '$m menit lagi';
  }
}

/// Full prayer schedule for a day
class PrayerSchedule {
  final String date;
  final String hijriDate;
  final String location;
  final List<PrayerTimeData> prayers;
  final DateTime? sunrise;
  final DateTime? sunset;

  const PrayerSchedule({
    required this.date,
    required this.hijriDate,
    required this.location,
    required this.prayers,
    this.sunrise,
    this.sunset,
  });

  PrayerTimeData? get nextPrayer {
    for (final p in prayers) {
      if (!p.isPassed) return p;
    }
    return null;
  }

  /// Whether all prayers for today have passed (e.g. after Isha)
  bool get allPassed => prayers.every((p) => p.isPassed);

  PrayerTimeData? get currentPrayer {
    final now = DateTime.now();
    PrayerTimeData? current;
    for (final p in prayers) {
      if (p.time.isAfter(now)) break;
      current = p;
    }
    return current;
  }

  NextPrayerInfo? get nextPrayerInfo {
    final next = nextPrayer;
    if (next == null) return null;
    return NextPrayerInfo(
      name: next.name,
      arabicName: next.arabicName,
      time: next.time,
      remaining: next.time.difference(DateTime.now()),
    );
  }
}

/// Service to fetch prayer times via Aladhan API
class PrayerTimesService {
  static const _baseUrl = 'https://api.aladhan.com/v1';

  /// Indonesia cities with coordinates
  static const _indonesiaCities = {
    'Jakarta': {'lat': -6.2088, 'lng': 106.8456},
    'Bandung': {'lat': -6.9175, 'lng': 107.6191},
    'Surabaya': {'lat': -7.2575, 'lng': 112.7521},
    'Medan': {'lat': 3.5952, 'lng': 98.6722},
    'Semarang': {'lat': -6.9666, 'lng': 110.4196},
    'Makassar': {'lat': -5.1477, 'lng': 119.4327},
    'Yogyakarta': {'lat': -7.7956, 'lng': 110.3695},
    'Palembang': {'lat': -2.9761, 'lng': 104.7754},
    'Denpasar': {'lat': -8.6705, 'lng': 115.2126},
    'Padang': {'lat': -0.9471, 'lng': 100.4172},
    'Pontianak': {'lat': -0.0263, 'lng': 109.3425},
    'Manado': {'lat': 1.4748, 'lng': 124.8421},
  };

  String? _selectedCity;
  double? _cachedLat;
  double? _cachedLng;
  PrayerSchedule? _cachedSchedule;
  DateTime? _cachedDate;

  String? get selectedCity => _selectedCity;
  List<String> get availableCities => _indonesiaCities.keys.toList();

  /// Get current location or default to Jakarta
  Future<void> initLocation() async {
    try {
      // Check if location permission granted
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        final position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.low,
            timeLimit: Duration(seconds: 5),
          ),
        );
        _cachedLat = position.latitude;
        _cachedLng = position.longitude;
        _selectedCity = null; // Using GPS
        return;
      }
    } catch (_) {
      // Fallback to Jakarta
    }

    // Default to Jakarta
    _cachedLat = _indonesiaCities['Jakarta']!['lat']!;
    _cachedLng = _indonesiaCities['Jakarta']!['lng']!;
    _selectedCity = 'Jakarta';
  }

  /// Set city manually
  void setCity(String city) {
    final coords = _indonesiaCities[city];
    if (coords != null) {
      _selectedCity = city;
      _cachedLat = coords['lat'];
      _cachedLng = coords['lng'];
      _cachedSchedule = null; // Clear cache
    }
  }

  /// Fetch today's prayer times
  Future<PrayerSchedule> getTodayPrayerTimes() async {
    _cachedLat ??= -6.2088;
    _cachedLng ??= 106.8456;

    // Check cache (same day)
    final now = DateTime.now();
    if (_cachedSchedule != null &&
        _cachedDate != null &&
        _cachedDate!.year == now.year &&
        _cachedDate!.month == now.month &&
        _cachedDate!.day == now.day) {
      return _cachedSchedule!;
    }

    try {
      final today = '${now.day}-${now.month}-${now.year}';
      final url =
          '$_baseUrl/timingsByCity/$today?city=${_selectedCity ?? "Jakarta"}'
          '&country=Indonesia&method=20';

      final response = await _fetchWithTimeout(url);
      final data = jsonDecode(response);

      if (data['code'] == 200) {
        final timings = data['data']['timings'] as Map<String, dynamic>;
        final hijri = data['data']['date']['hijri'] as Map<String, dynamic>;
        final gregorian =
            data['data']['date']['gregorian'] as Map<String, dynamic>;

        final todayDate = DateTime.now();
        final prayers = _parseTimings(timings, todayDate);
        final hijriStr =
            '${hijri['day']} ${hijri['month']['en']} ${hijri['year']}';
        final dateStr = gregorian['day'] == null
            ? today.toString().split(' ')[0]
            : '${gregorian["day"]} ${gregorian["month"]["en"]} ${gregorian["year"]}';

        _cachedSchedule = PrayerSchedule(
          date: dateStr,
          hijriDate: hijriStr,
          location: _selectedCity ?? 'Jakarta',
          prayers: prayers,
          sunrise: _parseTime(timings['Sunrise'] as String, todayDate),
          sunset: _parseTime(timings['Sunset'] as String, todayDate),
        );
        _cachedDate = todayDate;

        return _cachedSchedule!;
      }
    } catch (e) {
      debugPrint('PrayerTimes API error: $e');
    }

    // Fallback: return calculated schedule
    return _getFallbackSchedule();
  }

  /// Parse API timings into PrayerTimeData list
  List<PrayerTimeData> _parseTimings(
      Map<String, dynamic> timings, DateTime today) {
    final now = DateTime.now();
    const prayerNames = [
      ('Fajr', 'Fajr', 'فجر'),
      ('Sunrise', 'Syuruk', 'شروق'),
      ('Dhuhr', 'Dzuhur', 'ظهر'),
      ('Asr', 'Ashar', 'عصر'),
      ('Maghrib', 'Maghrib', 'مغرب'),
      ('Isha', 'Isya', 'عشاء'),
    ];

    return prayerNames.map((p) {
      final raw = timings[p.$1] as String?;
      final DateTime time;
      if (raw != null) {
        time = _parseTime(raw, today);
      } else {
        // Use a reasonable default instead of `now` to prevent all-passed
        time = _defaultTimeFor(p.$1, today);
      }
      return PrayerTimeData(
        name: p.$2,
        arabicName: p.$3,
        time: time,
        isPassed: time.isBefore(now),
      );
    }).toList();
  }

  /// Provide a reasonable default time when API value is missing
  DateTime _defaultTimeFor(String apiName, DateTime today) {
    switch (apiName) {
      case 'Fajr':
        return DateTime(today.year, today.month, today.day, 4, 30);
      case 'Sunrise':
        return DateTime(today.year, today.month, today.day, 5, 50);
      case 'Dhuhr':
        return DateTime(today.year, today.month, today.day, 11, 50);
      case 'Asr':
        return DateTime(today.year, today.month, today.day, 15, 10);
      case 'Maghrib':
        return DateTime(today.year, today.month, today.day, 17, 45);
      case 'Isha':
        return DateTime(today.year, today.month, today.day, 19, 0);
      default:
        return today;
    }
  }

  /// Parse "HH:MM" string to DateTime
  /// Handles formats like "04:33", "04:33 (WIB)", " 04:33 "
  DateTime _parseTime(String timeStr, DateTime baseDate) {
    // Strip timezone suffixes like " (WIB)"
    final cleaned = timeStr.replaceAll(RegExp(r'\s*\([^)]*\)'), '').trim();
    final parts = cleaned.split(':');
    if (parts.length < 2) return baseDate;
    final h = int.tryParse(parts[0].trim()) ?? 0;
    // Extract only leading digits from minute part (handles trailing chars)
    final minMatch = RegExp(r'^\d+').firstMatch(parts[1].trim());
    final m = int.tryParse(minMatch?.group(0) ?? '') ?? 0;
    return DateTime(
      baseDate.year,
      baseDate.month,
      baseDate.day,
      h.clamp(0, 23),
      m.clamp(0, 59),
    );
  }

  /// Fetch with timeout using http package (works on web + mobile)
  Future<String> _fetchWithTimeout(String url) async {
    final response = await http
        .get(Uri.parse(url))
        .timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      return response.body;
    }
    throw Exception('API returned status ${response.statusCode}');
  }

  /// Fallback when API fails — rough Indonesian estimation
  PrayerSchedule _getFallbackSchedule() {
    final now = DateTime.now();
    final dayOfYear = _dayOfYear(now);
    // Rough equation for equator-region prayer times
    final base = 6.0 + (dayOfYear - 80) * 0.02;

    final fajr = _makeTime(now, base - 0.5);
    final sunrise = _makeTime(now, base + 0.3);
    final dhuhr = _makeTime(now, base + 2.0);
    final asr = _makeTime(now, base + 4.5);
    final maghrib = _makeTime(now, base + 5.5);
    final isha = _makeTime(now, base + 7.0);

    return PrayerSchedule(
      date: '${now.day}/${now.month}/${now.year}',
      hijriDate: 'Estimasi',
      location: _selectedCity ?? 'Jakarta',
      prayers: [
        PrayerTimeData(name: 'Fajr', arabicName: 'فجر', time: fajr, isPassed: fajr.isBefore(now)),
        PrayerTimeData(name: 'Syuruk', arabicName: 'شروق', time: sunrise, isPassed: sunrise.isBefore(now)),
        PrayerTimeData(name: 'Dzuhur', arabicName: 'ظهر', time: dhuhr, isPassed: dhuhr.isBefore(now)),
        PrayerTimeData(name: 'Ashar', arabicName: 'عصر', time: asr, isPassed: asr.isBefore(now)),
        PrayerTimeData(name: 'Maghrib', arabicName: 'مغرب', time: maghrib, isPassed: maghrib.isBefore(now)),
        PrayerTimeData(name: 'Isya', arabicName: 'عشاء', time: isha, isPassed: isha.isBefore(now)),
      ],
      sunrise: sunrise,
      sunset: maghrib,
    );
  }

  DateTime _makeTime(DateTime base, double hours) {
    final h = hours.floor();
    final m = ((hours - h) * 60).round();
    return DateTime(base.year, base.month, base.day, h.clamp(0, 23), m.clamp(0, 59));
  }

  int _dayOfYear(DateTime date) {
    return date.difference(DateTime(date.year, 1, 1)).inDays + 1;
  }
}
