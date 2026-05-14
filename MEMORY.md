#  Manaqib App — Session Memory & Changelog

> File ini mencatat setiap perubahan yang dilakukan pada project.
> Update setiap kali ada modifikasi code, desain, atau fitur baru.

---

## 📌 Project Info

| Info | Detail |
|------|--------|
| **Nama App** | Manaqib - Masjid Darussa'adah |
| **Framework** | Flutter |
| **State Management** | Provider |
| **Routing** | GoRouter |
| **Storage** | SharedPreferences |
| **Repo** | `/Users/bobbyryandra/Desktop/idea/masjid/aflikasi/manaqib-app` |

---

## 🎨 UI/UX Reference

**Source:** `assets/images/ref-mockup.webp` (SalahMate app design)

### Design Tokens (from mockup):
| Token | Value |
|-------|-------|
| Primary Color | Deep emerald green `#0D4B3F` |
| Accent | Gold `#D4A843`, Sky blue `#5BA4CF` |
| Typography | Serif headings + sans-serif body |
| Cards | Rounded 16px, subtle shadows |
| Motifs | Lanterns, mosque, crescent, geometric patterns |

### Screens di Mockup:
1. **Splash/Onboarding** — Deep emerald, mosque silhouette, lanterns
2. **Home/Feed** — Light bg, story circles, card-based content
3. **Prayer Times** — Sky blue gradient, circular time indicator

---

## 📝 Changelog

### 2026-05-14 — Theme Redesign (Session Start)

#### ✅ Done:
| Task | Files | Token Est. | Status |
|------|-------|------------|--------|
| Create color tokens & theme data | `lib/theme/theme_data.dart` | ~5k | ✅ |
| Apply new theme to app | `lib/main.dart` | ~1k | ✅ |
| Fix lint errors | `lib/theme/theme_data.dart` | ~2k | ✅ |
| Save session memory | `MEMORY.md` | ~1k | ✅ |

#### Color Changes:
| Token | Before | After |
|-------|--------|-------|
| Primary | `#1B7A3D` (hijau terang) | `#0D4B3F` (deep emerald) |
| Light BG | Default Material | `#F8F9FA` (off-white) |
| Dark BG | Default Material Dark | `#0F1923` (dark navy) |
| Dark Surface | Default Material Dark | `#1A2634` |
| Card Radius | Default | `16px` |
| Button Radius | Default | `12px` |

#### 📁 Files Modified:
- ✅ NEW: `lib/theme/theme_data.dart` — AppColors + AppTheme class
- ✅ EDIT: `lib/main.dart` — pake `AppTheme.lightTheme` & `AppTheme.darkTheme`
- ✅ NEW: `MEMORY.md` — session memory & changelog
- ✅ EDIT: `DESIGN_NOTES.md` — updated dengan status implementasi

---

### 2026-05-14 — Priority 2: Home Screen Redesign

#### ✅ Done:
| Task | Files | Status |
|------|-------|--------|
| Redesign bottom navigation bar | `lib/widgets/main_shell.dart` | ✅ |
| Redesign home screen layout | `lib/screens/home_screen.dart` | ✅ |
| Create cek-kuota-bobby skill | `~/.pi/agent/skills/cek-kuota-bobby/SKILL.md` | ✅ |

#### Home Screen Changes:

### 2026-05-14 — Priority 3 & 4: Typography + AppBar Styling

#### ✅ Done:
| Task | Files | Status |
|------|-------|--------|
| Typography upgrade (serif headings + sans body) | `lib/theme/theme_data.dart` | ✅ |
| AppBar global styling (serif title, popup, dialog) | `lib/theme/theme_data.dart` | ✅ |

#### Typography Changes:
| Text Style | Before | After |
|------------|--------|-------|
| Display / Headline / Title | Inter (sans-serif) | **Playfair Display** (serif) |
| Body / Label | Inter (sans-serif) | **Inter** (unchanged) |
| AppBar title | Default Roboto | **Playfair Display** 20px w700 |
| Dialog title | Default | **Playfair Display** 20px w700 |
| Button text | Default | **Inter** 15px w600 |
| Hint text | Default | **Inter** 14px with opacity |
| Popup menu | Default | Rounded 12px, elevation 8 |
| Dialog | Default | Rounded 20px corners |

#### AppBar Enhancements:
| Item | Before | After |
|------|--------|-------|
| Title font | Default Material | **Playfair Display** serif |
| `scrolledUnderElevation` | Default (2) | **0** (flat on scroll) |
| Popup menu shape | Default | Rounded **12px** |
| Dialog shape | Default | Rounded **20px** |
| Light title color | White | White (unchanged) |
| Dark title color | Default | `darkTextPrimary` |

#### `AppFonts` utility class added:
- `AppFonts.headingLarge` — Playfair 22px w700
- `AppFonts.headingMedium` — Playfair 17px w700
- `AppFonts.headingSmall` — Playfair 15px w600
- `AppFonts.body` — Inter 14px
- `AppFonts.bodySmall` — Inter 12px
- `AppFonts.bodyBold` — Inter 14px w600

#### 📁 Files Modified:
- ✅ EDIT: `lib/theme/theme_data.dart` — full typography + AppBar overhaul
- ✅ EDIT: `lib/screens/search_screen.dart` — search screen polish
- ✅ EDIT: `lib/screens/bookmarks_screen.dart` — removed unused GoogleFonts import
- ✅ EDIT: `lib/screens/reading_screen.dart` — removed unused GoogleFonts + go_router imports
- ✅ EDIT: `lib/screens/home_screen.dart` — full home screen redesign
- ✅ EDIT: `lib/widgets/main_shell.dart` — custom bottom nav

### 2026-05-14 — Priority 5: Search Screen Polish

#### ✅ Done:
| Task | Files | Status |
|------|-------|--------|
| Search screen redesign | `lib/screens/search_screen.dart` | ✅ |

#### Search Screen Changes:
| Item | Before | After |
|------|--------|-------|
| **AppBar** | Search bar inside AppBar | Clean AppBar with title "Cari Bacaan" + search icon |
| **Search bar** | Inline `TextField` in AppBar | Standalone card below AppBar — rounded 16px, border, shadow |
| **Clear button** | `IconButton` default | Custom rounded pill button with primary tint |
| **Result cards** | Default `Card` widget | Custom container with left color accent bar + border + shadow |
| **Category badge** | `primaryContainer` flat chip | Color-coded badge with category color + 0.12 alpha bg |
| **Empty state** | Plain icon + text | Decorative circle container + heading "Cari Bacaan" |
| **No results** | Plain icon + text | Orange-tinted decorative circle + heading "Tidak Ditemukan" |
| **Bottom padding** | None | Built into ListView |

#### Widgets created:
- `_EmptyState` — decorative search icon circle + guidance text
- `_NoResultsState` — orange-tinted icon circle + suggestion text

#### 📁 Files Modified:
- ✅ EDIT: `lib/screens/search_screen.dart` — full search screen redesign

### 2026-05-14 — Priority 6: Reading Screen Polish

#### ✅ Done:
| Task | Files | Status |
|------|-------|--------|
| Reading screen redesign | `lib/screens/reading_screen.dart` | ✅ |

#### Reading Screen Changes:
| Item | Before | After |
|------|--------|-------|
| **Bookmark icon** | Primary color | **Gold** color |
| **Section indicator** | Plain dots | **Animated active dot** (pill 24px) + shadow + prev/next nav buttons |
| **Section title** | Plain text | Serif heading + **ornamental divider** with gold star |
| **Arabic text card** | Simple border container | Decorative card with **gold corner ornaments** + subtle green tint + shadow |
| **Corner ornaments** | None | **CustomPainter** gold L-shaped corners (4 corners) |
| **Translation card** | Flat `primaryContainer` bg | Card with **left accent bar** (primary) + "Arti Bahasa" label + icon |
| **Latin text** | Plain italic | Italic with letterSpacing 0.2 |
| **Source note** | Not shown | New: book icon + italic grey text |
| **Page indicator** | "1 dari 3 bagian" plain | **Gold decorative dots** on both sides + styled text |
| **Swipe hint** | None | **Animated slide hint** on first section (nudge left) |
| **Menu styling** | Flat items | Improved: "Font Arab" header with badge, rounded toggles |

#### New Widgets:
- `_ArabicTextCard` — decorative card with gold corner ornaments
- `_CornerOrnament` / `_CornerPainter` — CustomPainter gold L-shaped corners
- `_LatinText` — styled italic latin text
- `_TranslationCard` — accent bar card with "Arti Bahasa" label
- `_SourceNote` — book icon + italic source reference
- `_PageIndicator` — gold-dotted page indicator
- Swipe hint animation (SingleTickerProviderStateMixin)

#### 📁 Files Modified:
- ✅ EDIT: `lib/screens/reading_screen.dart` — full reading screen redesign

### 2026-05-14 — Priority 7: Splash/Onboarding Screen

#### ✅ Done:
| Task | Files | Status |
|------|-------|--------|
| Create splash/onboarding screen | `lib/screens/splash_screen.dart` | ✅ |
| Wire splash into router | `lib/router/app_router.dart` | ✅ |

#### Splash Screen Design:
| Element | Detail |
|---------|--------|
| **Background** | Gradient emerald → dark → near-black |
| **Geometric pattern** | 8-pointed star Islamic pattern overlay (4% opacity) |
| **Lanterns** | CustomPainter lanterns (top-left & top-right) with gold outline |
| **Crescent moon** | CustomPainter crescent moon with gold stroke |
| **Stars** | 3 scattered 5-pointed stars with gold fill |
| **Logo** | Animated scale + fade — mosque emoji in gold-bordered circle |
| **Bismillah** | Arabic text in gold (Amiri font) |
| **App name** | "Manaqib" in Playfair Display 36px white |
| **Subtitle** | "Masjid Darussa'adah" in Playfair 15px |
| **Divider** | Gold line with star ornament |
| **Description** | Soft white text explaining the app |
| **Enter button** | Gold gradient button with press animation |

#### Animations (staggered, 2.4s total):
| Phase | Time | Element | Animation |
|-------|------|---------|----------|
| 1 | 0-960ms | Logo | Fade + Scale (easeOutBack) |
| 2 | 600-1320ms | Pattern/Lanterns/Stars | Fade in |
| 3 | 960-1440ms | Bismillah + Title | Fade |
| 4 | 1200-1560ms | Subtitle + Description | Fade |
| 5 | 1560-2040ms | Enter button | Fade + Slide up (20px) |

#### CustomPainters created:
- `_SplashPatternPainter` — 8-pointed star background pattern
- `_LanternPainter` — Islamic lantern with hook, cap, body, tassel |
- `_CrescentPainter` — crescent moon arc |
- `_StarPainter` — 5-pointed star fill |

#### Router change:
- `initialLocation` changed from `'/'` to `'/splash'`
- Splash route added as top-level route (outside ShellRoute)

#### 📁 Files Modified:
- ✅ NEW: `lib/screens/splash_screen.dart` — splash/onboarding screen
- ✅ EDIT: `lib/router/app_router.dart` — splash as initial route

#### ⏭️ Next Priority:
| # | Task | Status |
|---|------|--------|
| ~~1~~ | ~~Bottom Navigation redesign~~ | ✅ |
| ~~2~~ | ~~Home Screen card layout~~ | ✅ |
| ~~3~~ | ~~Typography + AppBar styling~~ | ✅ |
| ~~5~~ | ~~Search screen polish~~ | ✅ |
| ~~6~~ | ~~Reading screen polish~~ | ✅ |
| ~~7~~ | ~~Splash/Onboarding~~ | ✅ |

**🎉 Semua priority selesai!**

### 2026-05-14 — Bug Fix & QA Pass

#### ✅ Done:
| Task | Files | Status |
|------|-------|--------|
| Fix hardcoded `fontFamily` in splash | `lib/screens/splash_screen.dart` | ✅ |
| Fix test file (`MyApp` → `ManaqibApp`) | `test/widget_test.dart` | ✅ |
| Add `MultiProvider` wrapper in test | `test/widget_test.dart` | ✅ |
| Remove unused import in test | `test/widget_test.dart` | ✅ |

#### Bugs Found & Fixed:
| # | Bug | Severity | Fix |
|---|-----|----------|-----|
| 1 | `fontFamily: 'Amiri'` hardcoded — font tidak render tanpa GoogleFonts loader | 🔴 Runtime | → `GoogleFonts.amiri()` |
| 2 | `fontFamily: 'PlayfairDisplay'` hardcoded (3x) — sama seperti #1 | 🔴 Runtime | → `GoogleFonts.playfairDisplay()` |
| 3 | Test references `MyApp` — class tidak ada | 🔴 Error | → `ManaqibApp` |
| 4 | Test missing `MultiProvider` — `ThemeProvider` not found | 🔴 Runtime | → Added providers |
| 5 | Unused import `flutter/material.dart` in test | 🟡 Warning | → Removed |

#### QA Results:
```
✅ flutter analyze → 0 errors, 0 warnings (info only)
✅ flutter test    → 3/3 tests passed
✅ flutter build web → Build successful
```

#### 📁 Files Modified:
- ✅ EDIT: `lib/screens/splash_screen.dart` — fixed hardcoded fontFamily → GoogleFonts
- ✅ EDIT: `test/widget_test.dart` — fixed MyApp + MultiProvider + unused import

---


### 2026-05-14 — Jadwal Sholat Feature

#### ✅ Done:
| Task | Files | Status |
|------|-------|--------|
| Create prayer times service | `lib/services/prayer_times_service.dart` | ✅ |
| Add geolocator + intl deps | `pubspec.yaml` | ✅ |
| Create prayer screen UI | `lib/screens/prayer_screen.dart` | ✅ |
| Add to router + bottom nav | `lib/router/app_router.dart`, `lib/widgets/main_shell.dart` | ✅ |

#### Prayer Times Architecture:
| Komponen | Detail |
|----------|--------|
| **API** | Aladhan API (free, no key) — via `http` package (cross-platform) |
| **Geolocation** | Geolocator → auto detect / fallback Jakarta |
| **City selection** | 12 kota Indonesia built-in |
| **Fallback** | Estimasi lokal (equator region) kalau internet mati |
| **Cache** | In-memory per-hari |

#### Data Models:
- `PrayerTimeData` — name, arabicName, time, isPassed
- `NextPrayerInfo` — name, time, remaining duration
- `PrayerSchedule` — date, hijriDate, location, prayers list, allPassed

#### Prayer Screen Design:
| Element | Detail |
|---------|--------|
| **Header card** | Emerald gradient (matching beranda), Islamic pattern overlay, stats row |
| **Next prayer card** | Gold border, countdown, arabic name circle |
| **All-done card** | Banner "Semua sholat hari ini telah selesai" + doa |
| **Timeline list** | 6 prayers (Fajr → Isya), checkmark untuk passed (no strikethrough) |
| **City selector** | 12 kota Indonesia via popup menu |
| **Geolocation** | Auto GPS, fallback Jakarta |
| **API** | Aladhan.com (free), cached per-hari |

#### Bottom Nav Changes:
| Before (4 tabs) | After (5 tabs) |
|---------|--------|
| Beranda · Cari · Tersimpan · Setelan | Beranda · **Sholat** · Cari · Tersimpan · Setelan |

#### 📁 Files Modified:
- ✅ NEW: `lib/services/prayer_times_service.dart` — API + geolocator + fallback
- ✅ NEW: `lib/screens/prayer_screen.dart` — full prayer times UI
- ✅ EDIT: `lib/widgets/main_shell.dart` — added Sholat tab (5 tabs)
- ✅ EDIT: `lib/router/app_router.dart` — added /prayer route
- ✅ EDIT: `pubspec.yaml` — added geolocator + intl + http

---

### 2026-05-14 — Prayer Screen Theme Match + Bug Fix

#### ✅ Done:
| Task | Files | Status |
|------|-------|--------|
| Match prayer header to beranda theme | `lib/screens/prayer_screen.dart` | ✅ |
| Fix API call for Flutter Web | `lib/services/prayer_times_service.dart` | ✅ |
| Fix all-passed UI (strikethrough) | `lib/screens/prayer_screen.dart` | ✅ |
| Add all-done banner | `lib/screens/prayer_screen.dart` | ✅ |
| Add safe time fallback | `lib/services/prayer_times_service.dart` | ✅ |

#### Bugs Fixed:
| # | Bug | Root Cause | Fix |
|---|-----|-----------|-----|
| 1 | Semua sholat dicoret & tidak tampil | `dart:io` HttpClient tidak jalan di Flutter Web → API gagal → fallback waktu salah → semua "passed" | Ganti ke `http` package (cross-platform) |
| 2 | Parse time gagal | Format "HH:MM (WIB)" tidak di-handle | Regex strip timezone suffix + digit extraction |
| 3 | Fallback `today` = passed | `raw == null` → pakai `DateTime.now()` → otomatis passed | `_defaultTimeFor()` return waktu wajar per sholat |
| 4 | Strikethrough membuat teks hilang | Opacity 25% + `TextDecoration.lineThrough` | Hapus strikethrough, ganti ✅ icon saja, teks selalu full opacity |
| 5 | Setelah Isya semua kosong | Tidak ada state "all done" | Tambah `allPassed` flag + `_AllDoneCard` banner |

#### Theme Changes (prayer_screen → match beranda):
| Element | Before | After |
|---------|--------|-------|
| **Header gradient** | Sky blue (`5BA4CF → 1F6F96`) | Emerald (`primary → primaryDark → 062220`) |
| **Header shadow** | Sky blue glow | Emerald green glow |
| **Header pattern** | ❌ Tidak ada | ✅ Islamic geometric pattern overlay |
| **Header stats** | Plain text row | Frosted glass container + `_StatChip` (mirip beranda) |
| **AppBar title** | `theme.textTheme.titleMedium` | `GoogleFonts.playfairDisplay` + gold |
| **AppBar icon** | Default color | `AppColors.gold` |

#### 📁 Files Modified:
- ✅ EDIT: `lib/screens/prayer_screen.dart` — theme match + remove strikethrough + add _AllDoneCard
- ✅ EDIT: `lib/services/prayer_times_service.dart` — http package + robust parsing + fallback
- ✅ EDIT: `pubspec.yaml` — added `http: ^1.2.0`

---

### 2026-05-14 — Global AppBar Consistency

#### ✅ Done:
| Task | Files | Status |
|------|-------|--------|
| Unify all AppBar styles | 6 screens | ✅ |

#### AppBar Standard (diterapkan ke semua screen):
```
Row(
  children: [
    Icon(Icons.xxx, size: 22, color: AppColors.gold),
    SizedBox(width: 8),
    Text(
      'Judul',
      style: GoogleFonts.playfairDisplay(
        fontWeight: FontWeight.w700,
        color: isDark ? AppColors.gold : Colors.white,
      ),
    ),
  ],
)
```

#### Per-Screen AppBar:
| Screen | Icon | Title |
|--------|------|-------|
| `home_screen.dart` | `Icons.mosque` | Manaqib |
| `prayer_screen.dart` | `Icons.access_time_rounded` | Jadwal Sholat |
| `bookmarks_screen.dart` | `Icons.bookmark_rounded` | Tersimpan |
| `disclaimer_screen.dart` | `Icons.gavel_rounded` | Sumber & Disclaimer |
| `reading_screen.dart` | `Icons.menu_book_rounded` | (dynamic: manaqib title) |
| `search_screen.dart` | `Icons.search` | Cari Bacaan |
| `settings_screen.dart` | `Icons.settings_rounded` | Setelan |
| `splash_screen.dart` | — (no AppBar, custom full-screen) | — |

#### 📁 Files Modified:
- ✅ EDIT: `lib/screens/bookmarks_screen.dart` — AppBar + imports (google_fonts, theme_data)
- ✅ EDIT: `lib/screens/disclaimer_screen.dart` — AppBar + imports (google_fonts, theme_data)
- ✅ EDIT: `lib/screens/reading_screen.dart` — AppBar + imports (google_fonts)
- ✅ EDIT: `lib/screens/search_screen.dart` — AppBar icon size + Playfair Display
- ✅ EDIT: `lib/screens/settings_screen.dart` — AppBar + imports (google_fonts, theme_data)

---

## 📊 Token Usage Tracker (Bobby Key)

| Session | Used | Remaining | Window |
|---------|------|-----------|--------|
| Start | 58,175 (0.4%) | ~14,941,825 | Reset ~4 jam |
| End of session | ~1.5M+ | ~13.5M+ | — |

---

## 📁 Complete File Manifest (All Sessions)

| File | Action | Description |
|------|--------|-------------|
| `lib/theme/theme_data.dart` | NEW → EDIT | Color tokens, typography, AppBar theme, AppFonts utility |
| `lib/widgets/main_shell.dart` | EDIT | Custom bottom nav (5 tabs, emerald bg, gold active) |
| `lib/screens/home_screen.dart` | EDIT | Hero header, story circles, accent bar cards, Islamic pattern |
| `lib/screens/search_screen.dart` | EDIT | Card-style search bar, accent bar results, decorative states |
| `lib/screens/reading_screen.dart` | EDIT | Gold corner ornaments, animated sections, styled translation card |
| `lib/screens/splash_screen.dart` | NEW | Emerald gradient, lanterns, crescent, staggered animations |
| `lib/router/app_router.dart` | EDIT | Splash as initial route `/splash` + /prayer route |
| `lib/screens/bookmarks_screen.dart` | EDIT | AppBar consistency (Playfair + gold icon) |
| `lib/screens/settings_screen.dart` | EDIT | AppBar consistency (Playfair + gold icon) |
| `lib/screens/disclaimer_screen.dart` | EDIT | AppBar consistency + Sumber Jadwal Sholat section |
| `lib/screens/prayer_screen.dart` | NEW → EDIT | Emerald header, no strikethrough, all-done card, http package |
| `lib/services/prayer_times_service.dart` | NEW → EDIT | Aladhan API via http, robust parsing, safe fallback |
| `lib/data/manaqib_content.dart` | — | Unchanged |
| `test/widget_test.dart` | EDIT | Fixed for ManaqibApp + MultiProvider |
| `pubspec.yaml` | EDIT | Added geolocator, intl, http, google_fonts deps |

---

### 2026-05-14 — Tawasul Reading Page

#### ✅ Done:
| Task | Files | Status |
|------|-------|--------|
| Add Tawasul content (6 sections) | `lib/data/manaqib_content.dart` | ✅ |
| Add Tawasul category to home | `lib/screens/home_screen.dart` | ✅ |
| Add Tawasul category color to search | `lib/screens/search_screen.dart` | ✅ |
| Add Tawasul references to disclaimer | `lib/screens/disclaimer_screen.dart` | ✅ |

#### Tawasul Content (id: 9, category: Tawasul):
| Section | Isi |
|---------|-----|
| **Istiftah — Hamdalah** | Alhamdulillahi rabbil 'aalamiin + shalawat umum (HR. Bukhari 263) |
| **Shalawat Tawassul** | Shalawat Munjiyat sebagai pengantar majelis manaqib |
| **Tawasul — Mengingat Allah** | Menyebut kebesaran Allah (ma'rifah, raghbah, rahbah) |
| **Tawasul — Wasilah Para Ulama** | Tawasul melalui Nabi SAW + Ibrahim AS (QS. Al-Ma'idah: 35) |
| **Tawasul — Syekh Abdul Qadir Al-Jailani** | Tawasul khusus melalui pendiri Thoriqoh Qodiriyyah (w. 561 H) |
| **Shalawat Penutup** | Doa Rabbanaa (QS. Al-Baqarah: 201) + shalawat (HR. Tirmidzi) |

#### Referensi yang ditambahkan di Disclaimer:
- Tradisi Thoriqoh Qodiriyyah — Syekh Abdul Qadir Al-Jailani
- Kitab Dalailul Khairat — Imam Al-Jazuli
- Al-Quran QS. Al-Ma'idah ayat 35 (dalil tawasul)
- Al-Quran QS. Al-Baqarah ayat 201 (doa Rabbanaa)
- HR. Tirmidzi (penutup shalawat)
- Penjelasan konsep tawasul (mayoritas ulama)

#### 📁 Files Modified:
- ✅ EDIT: `lib/data/manaqib_content.dart` — added Tawasul (id: 9, 6 sections)
- ✅ EDIT: `lib/screens/home_screen.dart` — added Tawasul category (coklat, 🕌)
- ✅ EDIT: `lib/screens/search_screen.dart` — added Tawasul category color
- ✅ EDIT: `lib/screens/disclaimer_screen.dart` — added Sumber Bacaan Tawasul section

---

### 2026-05-14 — Manaqib Syekh Abdul Qadir Al-Jailani

#### ✅ Done:
| Task | Files | Status |
|------|-------|--------|
| Add Manaqib full content (14 sections) | `lib/data/manaqib_content.dart` | ✅ |
| Add Manaqib references to disclaimer | `lib/screens/disclaimer_screen.dart` | ✅ |

#### Manaqib Content (id: 10, category: Tawasul):
| # | Section | Sumber |
|---|---------|--------|
| 1 | **Pujian kepada Allah** | Al-Fuyudhat Ar-Rabbaniyyah |
| 2 | **Sanjungan kepada Allah (Naat)** | Nadzam manaqib |
| 3 | **Shalawat kepada Nabi Muhammad SAW** | Pembuka manaqib |
| 4 | **Sanjungan kepada Nabi (Madih)** | Pujian sebagai wasilah |
| 5 | **Sanjungan kepada Syekh Abdul Qadir** | Quthb Aulia |
| 6 | **Syair Pujian Syekh Abdul Qadir** | Nadzam kedudukan beliau |
| 7 | **Karamah dan Kedudukan Syekh Abdul Qadir** | Doa dengan wasilah |
| 8 | **Istighfar** | HR. Bukhari 6307, Muslim 2702 |
| 9 | **Doa Penolak Bala** | HR. Abu Dawud 1556, Tirmidzi 3388 |
| 10 | **Doa Kepada Allah** | QS. Al-Ma'idah: 114 |
| 11 | **Dzikir Tahlil** | Kalimat syahadat + shalawat |
| 12 | **Dzikir Kebesaran Allah** | HR. Bukhari 6937, Muslim 937 |
| 13 | **Tasbih dan Taqdis** | QS. Ash-Shaffat: 180-182 |
| 14 | **Shalawat Akhir + Khatimah** | QS. Al-Baqarah: 201 + HR. Bukhari/Muslim |

#### Referensi yang ditambahkan di Disclaimer:
- Kitab Al-Fuyudhat Ar-Rabbaniyyah — karya Syekh Abdul Qadir Al-Jailani
- Kitab Futuh Al-Ghaib — karya Syekh Abdul Qadir Al-Jailani
- Profil Syekh Abdul Qadir Al-Jailani (470-561 H/1077-1166 M)
- Thoriqoh Qodiriyyah — didirikan di Baghdad
- Rujukan hadits: Bukhari, Muslim, Abu Dawud, Tirmidzi
- Rujukan Al-Quran: Al-Baqarah: 201, Al-Ma'idah: 35, 114, Ash-Shaffat: 180-182

#### 📁 Files Modified:
- ✅ EDIT: `lib/data/manaqib_content.dart` — added Manaqib Jailani (id: 10, 14 sections)
- ✅ EDIT: `lib/screens/disclaimer_screen.dart` — added Sumber Manaqib Syekh Abdul Qadir section
- ✅ EDIT: `lib/screens/home_screen.dart` — added featured Manaqib Jailani card (coklat gradient)

---

### 2026-05-14 — Full Audit: Bugs, Theme & References

#### ✅ Flutter Analyze:
- 0 errors, 0 warnings (66 info — prefer_const & deprecated RadioGroup)

#### ✅ Build Web:
- `flutter build web --release` — berhasil

#### 🔧 Bugs Fixed:
| # | Bug | File | Fix |
|---|-----|------|-----|
| 1 | `reading_screen.dart` error state — plain `Text('Tidak Ditemukan')` tanpa tema | `reading_screen.dart` | Ganti ke Row + Playfair Display + gold icon |

#### ✅ Theme Consistency (All AppBars):
| Screen | Icon | Font | Color | Status |
|--------|------|------|-------|--------|
| `home_screen.dart` | `Icons.mosque` 22px gold | PlayfairDisplay w700 | gold/white | ✅ |
| `prayer_screen.dart` | `Icons.access_time_rounded` 22px gold | PlayfairDisplay w700 | gold/white | ✅ |
| `bookmarks_screen.dart` | `Icons.bookmark_rounded` 22px gold | PlayfairDisplay w700 | gold/white | ✅ |
| `disclaimer_screen.dart` | `Icons.gavel_rounded` 22px gold | PlayfairDisplay w700 | gold/white | ✅ |
| `reading_screen.dart` | `Icons.menu_book_rounded` 22px gold | PlayfairDisplay w700 | gold/white | ✅ |
| `reading_screen.dart` (error) | `Icons.error_outline_rounded` 22px gold | PlayfairDisplay w700 | gold/white | ✅ (fixed) |
| `search_screen.dart` | `Icons.search` 22px gold | PlayfairDisplay w700 | gold/white | ✅ |
| `settings_screen.dart` | `Icons.settings_rounded` 22px gold | PlayfairDisplay w700 | gold/white | ✅ |
| `splash_screen.dart` | No AppBar (custom full-screen) | — | — | ✅ |

#### ✅ References Coverage:
| Konten (10 item) | Section Disclaimer | Status |
|-----------------|-------------------|--------|
| 1. Shalawat Badar | Sumber Shalawat | ✅ |
| 2. Shalawat Munjiyat | Sumber Shalawat | ✅ |
| 3. Shalawat Nariyah | Sumber Shalawat | ✅ |
| 4. Shalawat Fatih | Sumber Shalawat | ✅ |
| 5. Dzikir Pagi | Sumber Dzikir & Doa | ✅ |
| 6. Dzikir Petang | Sumber Dzikir & Doa | ✅ |
| 7. Doa Setelah Shalat | Sumber Dzikir & Doa | ✅ |
| 8. Tahlil & Takbir | Sumber Dzikir & Doa | ✅ |
| 9. Tawasul (Pembukaan) | Sumber Bacaan Tawasul | ✅ |
| 10. Manaqib Jailani | Sumber Manaqib Syekh Abdul Qadir | ✅ |
| — | Sumber Konten Al-Quran | ✅ |
| — | Sumber Jadwal Sholat | ✅ |
| — | Sumber Teks Latin | ✅ |
| — | Sumber Ketentuan Teks Latin | ✅ |
| — | Validasi & Keterbatasan | ✅ |
| — | Referensi Desain UI/UX | ✅ |
| — | Teknologi | ✅ |
| — | Disclaimer Resmi | ✅ |

#### ✅ Other Checks:
- All 35 sections have `sourceNote` (0 empty)
- `dart:io` fully removed from prayer service (uses `http` package)
- Bookmark & search access all 10 items (including id 9 & 10)
- Manaqib Jailani (id:10) excluded from categories, shown as featured card
- Tawasul (id:9) shown in category list + searchable + bookmarkable

---

*Last updated: 2026-05-14*
