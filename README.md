# Manaqib App

Aplikasi Manaqib - Masjid Darussa'adah

## Kumpulan Shalawat, Dzikir & Doa

Aplikasi untuk memudahkan jamaah membaca shalawat, dzikir, dan doa sehari-hari.

## Fitur

- 📖 **Beranda** - Daftar semua bacaan berdasarkan kategori
- 🔍 **Pencarian** - Cari bacaan berdasarkan judul, arab, atau terjemahan
- 🔖 **Markah** - Simpan bacaan favorit
- 🌙 **Mode Gelap** - Tampilan gelap untuk kenyamanan membaca
- ⚙️ **Pengaturan** - Ubah ukuran huruf, tampilan latin, terjemahan

## Tech Stack

- **Flutter** - Cross-platform mobile framework
- **Provider** - State management
- **GoRouter** - Declarative routing
- **SharedPreferences** - Local storage

## Cara Menjalankan

```bash
# Install dependencies
flutter pub get

# Run on emulator/device
flutter run

# Build APK
flutter build apk
```

## Struktur Project

```
lib/
├── main.dart                    # Entry point
├── router/
│   └── app_router.dart          # GoRouter configuration
├── screens/
│   ├── home_screen.dart         # Beranda
│   ├── reading_screen.dart      # Layar baca
│   ├── search_screen.dart       # Pencarian
│   ├── bookmarks_screen.dart    # Markah tersimpan
│   └── settings_screen.dart     # Pengaturan
├── models/
│   └── manaqib.dart             # Data models
├── data/
│   └── manaqib_content.dart     # Konten bacaan
├── services/
│   └── bookmark_provider.dart   # Bookmark state
├── theme/
│   └── theme_provider.dart      # Theme state
├── widgets/
│   └── main_shell.dart          # Bottom navigation shell
└── assets/
    └── images/                  # Gambar & logo
```
