import '../models/manaqib.dart';

/// Koleksi Maulid & Qasidah:
/// - Barzanji (Maulid Al-Barzanji) karya Syekh Hasan Al-Barzanji
/// - Simtudduror karya Habib Ali Al-Habsyi
/// - Qasidah Al-Burdah karya Imam Al-Bushiri
/// - Maulid Diba' (Ad-Diba'u) karya Syekh Abdurrahman Ad-Diba'i
final List<Manaqib> maulidQasidahList = [
  // ═══════════════════════════════════════════════════════
  // BARZANJI — Maulid Al-Barzanji
  // ═══════════════════════════════════════════════════════
  Manaqib(
    id: 101,
    title: 'Barzanji',
    arabicTitle: 'مَوْلِدُ الْبَرْزِنْجِي',
    description:
        'Maulid Al-Barzanji — syair pujian kepada Nabi Muhammad SAW karya Syekh Hasan Al-Barzanji. Dibaca di majelis maulid dan peringatan hari lahir Nabi.',
    category: 'Maulid & Qasidah',
    source: 'Kitab Iqazul Himam, Syekh Hasan Al-Barzanji (w. 1184 H)',
    validityNote:
        'Maulid Al-Barzanji disusun oleh Syekh Hasan bin Abdullah Al-Barzanji (w. 1184 H/1770 M), ulama dari Barzanj, Kurdistan. Kitab ini sangat populer di Nusantara dan menjadi bacaan utama di majelis maulid.',
    sections: [
      ManaqibSection(
        title: 'Pembukaan — Hamdalah & Shalawat',
        arabicText:
            'اَلْحَمْدُ لِلّٰهِ رَبِّ الْعَالَمِينَ وَالصَّلَاةُ وَالسَّلَامُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ أَجْمَعِينَ',
        translation:
            'Segala puji bagi Allah Tuhan seluruh alam, dan shalawat serta salam semoga tercurahkan kepada junjungan kami Muhammad, keluarga, dan seluruh sahabatnya.',
        latinText:
            'Alhamdulillahi rabbil \'aalamiin, wash-shalaatu was-salaamu \'ala sayyidinaa Muhammad wa \'ala aalihi wa shahbihi ajma\'iin.',
        sourceNote: 'Pembuka Barzanji — pujian kepada Nabi SAW',
      ),
      ManaqibSection(
        title: 'Pujian kepada Nabi Muhammad SAW',
        arabicText:
            'يَا أَشْرَفَ الْخَلْقِ وَأَكْرَمَ الرَّسُولِ مَنْ لَمْ يَكُنْ لَهُ نَظِيرٌ فِي الْأَصْلِ وَالْفَصْلِ',
        translation:
            'Wahai seagung-agung makhluk dan semulia-mulia rasul. Yang tidak ada bandingannya dalam asal maupun keturunan.',
        latinText:
            "Yaa asyrofal kholqi wa akromar rosuul, man lam yakun lahu nazhiirun fil ashli wal fashl.",
        sourceNote: 'Sanjungan kepada Nabi SAW — Barzanji',
      ),
      ManaqibSection(
        title: 'Nasab Nabi Muhammad SAW',
        arabicText:
            'عَبْدُ اللّٰهِ ثُمَّ عَبْدُ الْمُطَّلِبِ ثُمَّ هَاشِمٌ ثُمَّ عَبْدُ مَنَافٍ\nفَإِنَّ نَسَبَ الْمُصْطَفَى مِنْ أَشْرَفِ النَّسَبِ شَرُفَتْ بِهِ الْعَرَبُ وَمَضَرُ وَرَبِيعَةُ',
        translation:
            '(Putra) Abdullah, kemudian Abdul Muththalib, kemudian Hasyim, kemudian Abdu Manaf. Sesungguhnya nasab Al-Mushthafa (Nabi SAW) termasuk nasab yang paling mulia. Dengan beliau menjadi mulia Arab, Mudhar, dan Rabi\'ah.',
        latinText:
            "Abdullahi tsumma Abdul Muththalib, tsumma Haasyimun tsumma Abdi Manaaf. Fa inna nasabal Mushthofa min asyrofin nasab, syarafat bihil 'arobu wa Mudhoru wa Robii'ah.",
        sourceNote: 'Silsilah keturunan Nabi SAW — Barzanji',
      ),
      ManaqibSection(
        title: 'Kelahiran Nabi Muhammad SAW',
        arabicText:
            'وُلِدَ الْمُصْطَفَى بِمَكَّةَ فِي رَبِيعِ الْأَوَّلِ عَامَ الْفِيلِ فِي الثَّانِي عَشَرَ',
        translation:
            'Al-Mushthafa lahir di Makkah pada bulan Rabiul Awal, tahun Gajah, pada tanggal dua belas.',
        latinText:
            "Wulidal Mushthofa bi Makkata fi Robii'il Awwal, 'aamal fiili fits tsaanii 'asyar.",
        sourceNote: 'Kisah kelahiran Nabi SAW — Barzanji',
      ),
      ManaqibSection(
        title: 'Nur Muhammad Menyinari Alam',
        arabicText:
            'أَشْرَقَتِ الْأَرْضُ بِنُورِهِ وَبِهْجَتِهِ وَاكْتَسَتِ السَّمَاءُ زِينَةً وَسُرُورًا',
        translation:
            'Bumi menjadi terang dengan cahaya dan kegembiraan beliau, dan langit mengenakan hiasan serta sukacita.',
        latinText:
            "Asyroqotil ardhu binuurihi wa bahijatih, waktasatis samaa-u ziinatan wa suruuraa.",
        sourceNote: 'Cahaya Nabi menyinari alam — Barzanji',
      ),
      ManaqibSection(
        title: 'Pengasuhan Halimah As-Sa\'diyyah',
        arabicText:
            'أَرْضَعَتْهُ حَلِيمَةُ السَّعْدِيَّةُ فَكَانَ مِنْ يَوْمِ وِلَادَتِهِ مُبَارَكًا\nزَادَتِ الْبَرَكَاتُ فِي ضَيْعَتِهَا وَخَصَّبَ الْعُشْبُ وَالضَّرْعُ',
        translation:
            'Halimah As-Sa\'diyyah menyusui beliau, maka sejak hari kelahirannya beliau sudah penuh berkah. Berkah bertambah di tempat tinggalnya, dan rumput serta susu ternak menjadi berlimpah.',
        latinText:
            "Arlo'at-hu Haliimatus Sa'diyyah, fakaana min yaumi wiladatihi mubaarokaa. Zaaatil barokaatu fii dhoi'atihaa, wa khoshobal 'usybu wadhdhor'u.",
        sourceNote: 'Masa pengasuhan Halimah — Barzanji',
      ),
      ManaqibSection(
        title: 'Syi\'rul Maut (Sya\'ir Kematian)',
        arabicText:
            'يَا نَفْسُ مِيتِي قَبْلَ أَنْ تَمُوتِي فَالْمَوْتُ آتٍ لَا مَحَالَةَ آتِ\nيَا رَبِّ تَقَبَّلْ تَوْبَتِي وَارْحَمْنِي فَأَنْتَ رَبِّي وَأَنَا عَبْدُكَ الضَّعِيفُ',
        translation:
            'Wahai jiwa, matilah sebelum kau mati, sebab kematian itu pasti datang tak terelakkan. Ya Allah, terimalah taubatku dan rahmatilah aku, karena Engkaulah Tuhanku dan aku adalah hamba-Mu yang lemah.',
        latinText:
            "Yaa nafsu miitii qobla an tamuutii, fal mautu aatin laa mahaalata aati. Yaa Robbi taqobbal taubatii warhamni, fa Anta Robbii wa anaa 'abdu-kadh dho'iif.",
        sourceNote: 'Sya\'ir Kematian — bagian penutup Barzanji',
      ),
      ManaqibSection(
        title: 'Doa Penutup Barzanji',
        arabicText:
            'اَللّٰهُمَّ صَلِّ وَسَلِّمْ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ أَجْمَعِينَ',
        translation:
            'Ya Allah, limpahkanlah shalawat dan salam kepada junjungan kami Muhammad serta keluarga dan sahabatnya seluruhnya.',
        latinText:
            "Allahumma shalli wasallim 'ala sayyidina Muhammad wa 'ala aalihi wa shohbihi ajma'iin.",
        sourceNote: 'Doa penutup — Al-Baqarah: 201 + shalawat',
      ),
      ManaqibSection(
        title: 'Doa Rabbana',
        arabicText:
            'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
        translation:
            'Ya Tuhan kami, berikanlah kebaikan di dunia dan kebaikan di akhirat, serta lindungilah kami dari azab neraka.',
        latinText:
            'Robbanaa aatinaa fid dunyaa hasanatan wa fil aakhirati hasanatan wa qinaa \'adzaaban naar.',
        sourceNote: 'QS. Al-Baqarah: 201',
      ),
    ],
  ),

  // ═══════════════════════════════════════════════════════
  // SIMTUDDUROR — Simtudduror
  // ═══════════════════════════════════════════════════════
  Manaqib(
    id: 102,
    title: 'Simtudduror',
    arabicTitle: 'سِمْطُ الدُّرَرِ',
    description:
        'Simtudduror (Untaian Mutiara) — maulid karya Habib Ali Al-Habsyi. Dibaca di majelis maulid dan haul para habaib di seluruh Nusantara.',
    category: 'Maulid & Qasidah',
    source: 'Kitab Simtudduror, Habib Ali bin Muhammad Al-Habsyi (w. 1333 H)',
    validityNote:
        'Simtudduror disusun oleh Habib Ali bin Muhammad bin Husein Al-Habsyi (w. 1333 H/1914 M), ulama besar Hadramaut. Kitab ini sangat populer di Indonesia, terutama di kalangan pecinta Nabi dari keturunan Arab.',
    sections: [
      ManaqibSection(
        title: 'Pembukaan — Shalawat',
        arabicText:
            'اَللّٰهُمَّ صَلِّ وَسَلِّمْ عَلَى سَيِّدِنَا مُحَمَّدٍ صَلَاةً تُنْجِيْنَا بِهَا مِنْ جَمِيْعِ الْأَهْوَالِ وَالْآفَاتِ\nوَتَقْضِيْ لَنَا بِهَا جَمِيْعَ الْحَوَائِجِ وَتُطَهِّرُنَا بِهَا مِنْ جَمِيْعِ السَّيِّئَاتِ',
        translation:
            'Ya Allah, limpahkanlah shalawat dan salam kepada junjungan kami Muhammad, shalawat yang menyelamatkan kami dari segala ketakutan dan bencana, memenuhi segala kebutuhan kami, dan menyucikan kami dari segala keburukan.',
        latinText:
            "Allahumma shalli wasallim 'ala sayyidina Muhammad sholaatan tunjiinaa bihaa min jamii'il ahwaali wal aafaat, wa taqdhii lanaa bihaa jamii'al hawaa-ij, wa tuthohhirunaa bihaa min jamii'is sayyi-aat.",
        sourceNote: 'Shalawat pembuka Simtudduror',
      ),
      ManaqibSection(
        title: 'Pujian — Asmaul Husna',
        arabicText:
            'يَا رَحْمٰنُ يَا رَحِيمُ يَا كَرِيمُ يَا عَظِيمُ يَا عَلِيمُ\nيَا مَنْ لَا يَفْتَحُ أَحَدٌ مَا أَغْلَقَ وَلَا يُغْلِقُ مَا فَتَحَ إِلَّا اللّٰهُ',
        translation:
            'Wahai Yang Maha Pengasih, Wahai Yang Maha Penyayang, Wahai Yang Maha Mulia, Wahai Yang Maha Agung, Wahai Yang Maha Mengetahui. Wahai Dzat yang tidak ada seorang pun yang dapat membuka apa yang Dia tutup dan tidak ada yang dapat menutup apa yang Dia buka kecuali Allah.',
        latinText:
            "Yaa Rohmaanu yaa Rohiim, yaa Kariimu yaa 'Azhiimu yaa 'Aliim. Yaa man laa yaftahu ahadun maa aghlaqo wa laa yughliqu maa fatahaa illallah.",
        sourceNote: 'Asmaul Husna + shalawat — Simtudduror',
      ),
      ManaqibSection(
        title: 'Shalawat kepada Nabi SAW',
        arabicText:
            'صَلِّ وَسَلِّمْ عَلَى سَيِّدِنَا مُحَمَّدٍ\nصَلَّى اللّٰهُ عَلَيْهِ وَسَلَّمَ',
        translation:
            'Limpahkanlah shalawat dan salam kepada junjungan kami Muhammad. Semoga Allah melimpahkan shalawat dan salam kepadanya.',
        latinText:
            "Shalli wasallim 'ala sayyidina Muhammad. Shallallahu 'alaihi wasallam.",
        sourceNote: 'Shalawat — Simtudduror',
      ),
      ManaqibSection(
        title: 'Syair — Nur Muhammad',
        arabicText:
            'نُورُ نَبِيِّ اللّٰهِ قَبْلَ الْخَلْقِ كُلِّهِمْ ظَهَرَ فِي الْأَفَاقِ وَفِي الْأَرْضِ وَالسَّمَاءِ',
        translation:
            'Cahaya Nabi Allah telah ada sebelum seluruh makhluk. Terlihat di ufuk, di bumi, dan di langit.',
        latinText:
            "Nuuru Nabiyyillah qoblal kholqi kullihim, zhoharo fil afaaqi wa fil ardhi was samaa'.",
        sourceNote: 'Syair Nur Muhammad — Simtudduror',
      ),
      ManaqibSection(
        title: 'Syair — Nabi adalah Cahaya yang Memberi Syafaat',
        arabicText:
            'هُوَ الْحَبِيبُ الَّذِي يُرْجَى شَفَاعَتُهُ لِكُلِّ هَوْلٍ مِنَ الْأَهْوَالِ مُقْتَحَمُ',
        translation:
            'Dialah kekasih yang diharapkan syafaatnya, untuk segala ketakutan dari berbagai kesulitan yang akan dihadapi.',
        latinText:
            "Huwal habiibulladzi yurjaa syafaa'atuh, likulli hawlin minal ahwaali muqtaham.",
        sourceNote: 'Syair pujian Nabi SAW — Simtudduror',
      ),
      ManaqibSection(
        title: 'Syair — Kelahiran Nabi SAW',
        arabicText:
            'فِي لَيْلَةِ الثَّانِي عَشَرَ مِنْ رَبِيعِ الْأَوَّلِ وُلِدَ الْحَبِيبُ الْمُصْطَفَى مُحَمَّدٌ',
        translation:
            'Pada malam tanggal dua belas bulan Rabiul Awal, lahir sang kekasih Al-Mushthafa Muhammad.',
        latinText:
            "Fi lailatis tsaanii 'asyar min Robii'il Awwal, wulidal habiibul Mushthofa Muhammad.",
        sourceNote: 'Kisah kelahiran Nabi SAW — Simtudduror',
      ),
      ManaqibSection(
        title: 'Syair — Dunia Terang dengan Cahaya Nabi',
        arabicText:
            'أَشْرَقَتِ الدُّنْيَا بِنُورِ وَجْهِهِ وَفَرِحَتِ الْمَلَائِكَةُ وَالسَّمَاوَاتُ',
        translation:
            'Dunia menjadi terang dengan cahaya wajahnya, dan para malaikat serta langit-langit bergembira.',
        latinText:
            'Asyroqotid dunyaa binuuri wajhihi, wa farihatil malaa-ikatu was samaawaat.',
        sourceNote: 'Pujian kelahiran Nabi SAW — Simtudduror',
      ),
      ManaqibSection(
        title: 'Syair — Akhlak Nabi SAW',
        arabicText:
            'مَا رُئِيَ فِي الْوُجُودِ مِثْلُهُ وَلَا سُمِعَ فِي الْخَلَائِقِ نَظِيرُهُ',
        translation:
            'Tidak pernah ada yang semisal dengannya di alam wujud ini, dan tidak pernah terdengar ada bandingannya di seluruh makhluk.',
        latinText:
            "Maa ru-iya fil wujuudi misluh, wa laa sumi'a fil kholaa-iqi nazhiiruh.",
        sourceNote: 'Pujian akhlak Nabi SAW — Simtudduror',
      ),
      ManaqibSection(
        title: 'Syair — Akhlak Nabi adalah Al-Quran',
        arabicText:
            'كَانَ خُلُقُهُ الْقُرْآنُ الْعَظِيمُ أَحْسَنُ النَّاسِ خُلُقًا وَخَلْقًا',
        translation:
            'Akhlak beliau adalah Al-Quran Al-Azhim. Yang paling baik akhlak dan rupanya di antara manusia.',
        latinText:
            "Kaana khuluquhul qur-aanal 'azhiim, ahsanun naasi khuluqon wa kholqaa.",
        sourceNote: 'Pujian akhlak Nabi SAW — Simtudduror',
      ),
      ManaqibSection(
        title: 'Doa Penutup Simtudduror',
        arabicText:
            'اَللّٰهُمَّ اغْفِرْ لَنَا وَلِإِخْوَانِنَا الَّذِينَ سَبَقُونَا بِالْإِيمَانِ\nوَلَا تَجْعَلْ فِي قُلُوبِنَا غِلًّا لِلَّذِينَ آمَنُوا رَبَّنَا إِنَّكَ رَؤُوفٌ رَحِيمٌ',
        translation:
            'Ya Allah, ampunilah kami dan saudara-saudara kami yang telah mendahului kami dalam keimanan. Dan janganlah Engkau jadikan dalam hati kami kedengkian terhadap orang-orang yang beriman. Ya Tuhan kami, sesungguhnya Engkau Maha Pengasih lagi Maha Penyayang.',
        latinText:
            "Allahummaghfir lanaa wa li-ikhwaaninal ladziina sabaquunaa bil iimaan. Wa laa taj'al fii quluubinaa ghillan lilladziina aamanuu. Robbanaa innaka Ro-uufun Rohiim.",
        sourceNote: 'QS. Al-Hasyr: 10 + penutup Simtudduror',
      ),
    ],
  ),

  // ═══════════════════════════════════════════════════════
  // BURDAH — Qasidah Al-Burdah
  // ═══════════════════════════════════════════════════════
  Manaqib(
    id: 103,
    title: 'Qasidah Al-Burdah',
    arabicTitle: 'الْقَصِيدَةُ الْبُرْدَةُ',
    description:
        'Qasidah Al-Burdah (Syair Selendang) — mahakarya Imam Al-Bushiri berisi pujian mendalam kepada Nabi Muhammad SAW.',
    category: 'Maulid & Qasidah',
    source: 'Kitab Al-Burdah, Imam Syarafuddin Al-Bushiri (w. 695 H)',
    validityNote:
        'Qasidah Al-Burdah (Al-Kawakib Ad-Durriyyah fi Madh Khair Al-Bariyyah) disusun oleh Imam Muhammad bin Sa\'id Al-Bushiri (w. 695 H/1294 M). Kisah terkenal: Imam Al-Bushiri lumpuh lalu bermimpi Nabi SAW menyelimutinya dengan burdah (selendang), dan beliau sembuh. Di sini kami sajikan bait-bait terpilih.',
    sections: [
      ManaqibSection(
        title: 'Bait 1 — Kerinduan kepada Tetangga di Dzi Salam',
        arabicText:
            'أَمِنْ تَذَكُّرِ جِيرَانٍ بِذِي سَلَمِ مَزَجْتَ دَمْعًا جَرَى مِنْ مُقْلَةٍ بِدَمِ',
        translation:
            'Apakah karena teringat tetangga di Dzi Salam, kau campurkan air mata yang mengalir dari mata dengan darah.',
        latinText:
            "Am min tadzakkuri jiiraanin bidzi salami, mazaqta dam'an jaraa min muqlatin bidami.",
        sourceNote: 'Bait 1 — Pembuka Al-Burdah (Fashl Amr)',
      ),
      ManaqibSection(
        title: 'Bait 2 — Angin dan Petir dari Arah Kazhimah',
        arabicText:
            'أَمْ هَبَّتِ الرِّيحُ مِنْ تِلْقَاءِ كَاظِمَةٍ وَأَوْمَضَ الْبَرْقُ فِي الظَّلْمَاءِ مِنْ إِضَمِ',
        translation:
            'Ataukah angin berhembus dari arah Kazhimah, dan kilatan petir menyambar di kegelapan dari Idham.',
        latinText:
            "Am habbatis riihu min tilqaa-i kazhimah, wa awmadhol barqu fidh dholamaa-i min idham.",
        sourceNote: 'Bait 2 — Pembuka Al-Burdah (Fashl Amr)',
      ),
      ManaqibSection(
        title: 'Bait 3 — Air Mata yang Tak Tertahan',
        arabicText:
            'فَمَا لِعَيْنَيْكَ إِنْ قُلْتَ اكْفُفَا هَمَتَا وَمَا لِقَلْبِكَ إِنْ قُلْتَ اسْتَفِقْ يَهِمِ',
        translation:
            'Mengapa kedua matamu — jika kau berkata "tahanlah" — tetap mengalir? Dan mengapa hatimu — jika kau berkata "sadarlah" — tetap rindu?',
        latinText:
            "Famaa li 'ainika in qultakfufaa hamataa, wa maa liqolbika in qultas-tafiq yahimi.",
        sourceNote: 'Bait 3 — Kerinduan kepada Madinah',
      ),
      ManaqibSection(
        title: 'Bait 4 — Kesedihan dan Air Mata Tak Bisa Dihentikan',
        arabicText:
            'أَيَحْسَبُ الْحُزْنُ وَالشَّوْقُ مُنْكِفَأً وَالدَّمْعُ إِنْ كَفَّ يَوْمًا عَنِ الْهُجُومِ',
        translation:
            'Apakah kiranya kesedihan dan kerinduan bisa berhenti? Dan air mata — jika tertahan sehari — tak akan kembali mengalir?',
        latinText:
            "Ayahtsabul huznu wasy-syauqu munkafi-a, wad-dam'u in kaffa yauman 'anil hujuum.",
        sourceNote: 'Bait 4 — Kerinduan kepada Madinah',
      ),
      ManaqibSection(
        title: 'Bait 5 — Kerinduan Bergelora Saat Nabi Disebut',
        arabicText:
            'ذُكِرَ النَّبِيُّ فَهَاجَ الشَّوْقُ وَاشْتَعَلَتْ نَارُ الْحَنِينِ وَهَاجَتْ دَمْعَةً بِعَمِي',
        translation:
            'Ketika Nabi disebut, kerinduan pun bergelora, api kecintaan menyala dan mencucurkan air mata yang dalam.',
        latinText:
            "Dzikiran nabiyyu fahaajas syauqu wasy-ta'alat, naarul haniini wa haajat dam'atan bi'amii.",
        sourceNote: 'Bait 5 — Shalawat dalam Al-Burdah',
      ),
      ManaqibSection(
        title: 'Bait 6 — Shalawat untuk Nabi SAW',
        arabicText:
            'مَوْلَايَ صَلِّ وَسَلِّمْ أَبَدًا عَلَى خَيْرِ الْبَرِيَّةِ طُرًّا سَيِّدِ الْأُمَمِ',
        translation:
            'Wahai Tuhanku, limpahkanlah shalawat dan salam selamanya kepada sebaik-baik seluruh makhluk, pemimpin seluruh umat.',
        latinText:
            "Mawlaaya shalli wasallim abadan 'alaa khoiril bariyyati thorron sayyidil umam.",
        sourceNote: 'Bait 6 — Shalawat dalam Al-Burdah',
      ),
      ManaqibSection(
        title: 'Bait 7 — Nasab Nabi dari Tulang Sulbi',
        arabicText:
            'أَبْدَى لَهُ الْعَدْلُ مِنْ صُلْبٍ إِلٰى صُلُبٍ سِرًّا مِنَ السِّرِّ بَدَّاهُ مِنَ الْعَدَمِ',
        translation:
            'Keadilan menunjukkan kepadanya — dari tulang sulbi ke tulang sulbi, suatu rahasia dari rahasia-rahasia yang Dia wujudkan dari ketiadaan.',
        latinText:
            "Abdaa lahul 'adlu min shulbin ilaa shulub, sirran minas sirri baddaahu minal 'adami.",
        sourceNote: 'Bait 7 — Nasab Nabi dalam Al-Burdah',
      ),
      ManaqibSection(
        title: 'Bait 8 — Sebaik-baik Manusia dan Rasul',
        arabicText:
            'خَيْرُ الْأَنَامِ وَخَيْرُ الرُّسْلِ أَجْمَعِينَ مُحَمَّدٌ سَيِّدُ الْكَوْنَيْنِ وَالثَّقَلَيْنِ',
        translation:
            'Sebaik-baik manusia dan sebaik-baik seluruh rasul, Muhammad, pemimpin dua alam dan dua makhluk (jin dan manusia).',
        latinText:
            "Khoirul anaami wa khoirur rusli ajma'iin, Muhammadun sayyidul kaunaini wats tsaqalain.",
        sourceNote: 'Bait 8 — Nasab Nabi dalam Al-Burdah',
      ),
      ManaqibSection(
        title: 'Bait 9 — Ilmu yang Diberikan Tanpa Duga',
        arabicText:
            'وَلَهُمْ مِنَ الْعُلُومِ سَهْمٌ أَصَابَهُمْ مِنْ فَضْلِ رَبِّهِمُ بِغَيْرِ احْتِسَابِ',
        translation:
            'Dan mereka mendapat bagian ilmu yang mengenai mereka, dari keutamaan Tuhan mereka tanpa mereka duga.',
        latinText:
            "Wa lahum minal 'uluumi sahmun ashoobahum, min fadhli Rabbihim bighairi ihtisaab.",
        sourceNote: 'Bait 9 — Ilmu dalam Al-Burdah',
      ),
      ManaqibSection(
        title: 'Bait 10 — Ilmu Menjadi Cukup Sebagai Hamba',
        arabicText:
            'وَلَوْ لَمَّا يَكُنْ لَهُمْ مِنْ عِلْمِهِمْ أَحَدٌ لَكَفَاهُمُ عِلْمًا بِأَنَّهُمْ عِبَادِي',
        translation:
            'Dan seandainya tidak ada satu pun dari ilmu mereka, cukuplah bagi mereka ilmu bahwa mereka adalah hamba-hamba-Ku.',
        latinText:
            "Wa law lammaa yakun lahum min 'ilmihim ahad, lakafaahum 'ilman bi annahum 'ibaadii.",
        sourceNote: 'Bait 10 — Ilmu dalam Al-Burdah',
      ),
      ManaqibSection(
        title: 'Bait 11 — Memohon Syafaat Nabi SAW',
        arabicText:
            'يَا أَكْرَمَ الرُّسْلِ مَا لِي مَنْ أَلُوذُ بِهِ سِوَاكَ عِنْدَ حُلُولِ الْحَادِثِ الْعَمِمِ',
        translation:
            'Wahai seagung-agung para rasul, aku tak punya tempat berlindung selain dirimu, ketika peristiwa besar (hari kiamat) terjadi.',
        latinText:
            "Yaa akromar rusli maa lii man aluudzu bih, siwaaka 'inda huluulil haaditsil 'amim.",
        sourceNote: 'Bait 11 — Memohon syafaat Nabi SAW',
      ),
      ManaqibSection(
        title: 'Bait 12 — Dosa yang Berat dan Harapan Ampunan',
        arabicText:
            'إِنَّ لِي مِنَ الذُّنُوبِ ثِقَالًا وَأَنَا أَرْجُو عَفْوَ اللّٰهِ وَالْكَرَمِ',
        translation:
            'Sesungguhnya dosa-dosaku sungguh berat, dan aku berharap ampunan dan kemurahan Allah.',
        latinText:
            "Inna llaya minadz dzunuubi tsiqoolaa, wa anaa arjuu 'afwallaahi wal karam.",
        sourceNote: 'Bait 12 — Memohon syafaat Nabi SAW',
      ),
      ManaqibSection(
        title: 'Bait 13 — Para Sahabat Ahli Taqwa',
        arabicText:
            'وَأَلْحِقَنْ جَارِي بِجِيرَانِ الْحِمَى فَإِنَّهُمْ أَهْلُ التُّقَى وَالنُّسُكِ',
        translation:
            'Dan sertakanlah tetanggaku (para sahabat) dengan para tetangga Tanah Suci, karena mereka adalah ahli taqwa dan ibadah.',
        latinText:
            "Wa alhiqan jaarii bijiiraanil himaa, fa innahum ahlut tuqaa wan nusuk.",
        sourceNote: 'Bait 13 — Para Sahabat',
      ),
      ManaqibSection(
        title: 'Bait 14 — Shalawat kepada Kekasih Allah',
        arabicText:
            'وَصَلِّ رَبِّ عَلَى حَبِيبِكَ مُسْتَجَابًا بِهَا الدُّعَاءُ مُحَمَّدٍ ذِي الْكَرَمِ',
        translation:
            'Dan limpahkanlah shalawat wahai Tuhanku, kepada kekasih-Mu yang dikabulkan, dengannya segala doa, Muhammad yang memiliki kemuliaan.',
        latinText:
            "Wa shalli Rabbi 'ala habiibika mustajaabaa, bihad du'aa-u Muhammadin dzil karam.",
        sourceNote: 'Bait 14 — Penutup Qasidah Al-Burdah',
      ),
    ],
  ),

  // ═══════════════════════════════════════════════════════
  // MAULID DIBA' — Ad-Diba'u
  // ═══════════════════════════════════════════════════════
  Manaqib(
    id: 104,
    title: "Maulid Diba'",
    arabicTitle: 'الدِّيبَاعِي',
    description:
        "Maulid Ad-Diba'u — syair pujian kepada Nabi Muhammad SAW karya Syekh Abdurrahman Ad-Diba'i. Dibaca di majelis maulid dan haul.",
    category: 'Maulid & Qasidah',
    source: "Kitab Ad-Diba'ul Muqaddam, Syekh Abdurrahman Ad-Diba'i Asy-Syafi'i",
    validityNote:
        "Maulid Ad-Diba'u disusun oleh Syekh Abdurrahman bin Ali Ad-Diba'i Asy-Syafi'i (w. 944 H/1537 M), ulama dari Zabid, Yaman. Berisi pujian kepada Nabi SAW, kisah kelahiran, dan doa-doa.",
    sections: [
      ManaqibSection(
        title: 'Pembukaan — Hamdalah',
        arabicText:
            'اَلْحَمْدُ لِلّٰهِ رَبِّ الْعَالَمِينَ حَمْدًا يُوَافِي نِعَمَهُ وَيُكَافِئُ مَزِيدَهُ',
        translation:
            'Segala puji bagi Allah Tuhan seluruh alam, pujian yang sepadan dengan nikmat-nikmat-Nya dan membalas tambahannya.',
        latinText:
            "Alhamdulillahi rabbil 'aalamiin, hamdan yuwaafii ni'amahu wa yukaafi-u maziidah.",
        sourceNote: 'Pembuka Maulid Diba\'',
      ),
      ManaqibSection(
        title: 'Shalawat kepada Nabi Muhammad SAW',
        arabicText:
            'يَا رَبِّ صَلِّ وَسَلِّمْ عَلَى سَيِّدِنَا مُحَمَّدٍ النُّورِ السَّارِي وَالسِّرِّ الَّذِي فِي الْقَلْبِ قَدْ أُودِعَا',
        translation:
            'Ya Tuhan kami, limpahkanlah shalawat dan salam kepada junjungan kami Muhammad, cahaya yang menyinari dan rahasia yang tersimpan di dalam hati.',
        latinText:
            "Yaa Rabbi shalli wasallim 'ala sayyidina Muhammad, an nuuris saarii was sirril ladzii fil qolbi qod uudi'aa.",
        sourceNote: 'Shalawat Nabi — Maulid Diba\'',
      ),
      ManaqibSection(
        title: 'Shalawat Penyelamat',
        arabicText:
            'صَلَاةً تُنْجِينَا مِنْ جَمِيْعِ الْأَهْوَالِ وَالْآفَاتِ وَتَقْضِيْ لَنَا بِهَا جَمِيْعَ الْحَوَائِجِ',
        translation:
            'Shalawat yang menyelamatkan kami dari segala ketakutan dan bencana, dan memenuhi segala kebutuhan kami.',
        latinText:
            "Sholaatan tunjiinaa min jamii'il ahwaali wal aafaat, wa taqdhii lanaa bihaa jamii'al hawaa-ij.",
        sourceNote: 'Shalawat awal — Maulid Diba\'',
      ),
      ManaqibSection(
        title: 'Shalawat Penyuci',
        arabicText:
            'وَتُطَهِّرُنَا بِهَا مِنْ جَمِيْعِ السَّيِّئَاتِ وَتَرْفَعُنَا بِهَا عِنْدَكَ أَعْلَى الدَّرَجَاتِ',
        translation:
            'Dan menyucikan kami dari segala keburukan, serta mengangkat kami di sisi-Mu pada derajat tertinggi.',
        latinText:
            "Wa tuthohhirunaa bihaa min jamii'is sayyi-aat, wa tarfa'unaa bihaa 'indaka a'lad darajaat.",
        sourceNote: 'Shalawat penyuci — Maulid Diba\'',
      ),
      ManaqibSection(
        title: 'Syair — Cinta kepada Makkah',
        arabicText:
            'أَحَبُّ الْبِلَادِ إِلَيَّ مَكَّةُ لِأَنَّ فِيهَا بَيْتَ اللّٰهِ الْحَرَامِ',
        translation:
            'Negeri yang paling aku cintai adalah Makkah, karena di dalamnya terdapat Baitullah Al-Haram.',
        latinText:
            "Ahabbul bilaadi ilayya Makkah, li anna fiihaa Baitallahil haraam.",
        sourceNote: 'Syair cinta Makkah — Diba\'',
      ),
      ManaqibSection(
        title: 'Syair — Tempat Pijak Kaki Kekasih',
        arabicText:
            'وَأَحَبُّ مَا فِي مَكَّةَ الْحَرَامِ مَوْضِعُ قَدَمِ الْحَبِيبِ مُحَمَّدٍ',
        translation:
            'Dan yang paling aku cintai dari Makkah Al-Haram adalah tempat berpijaknya kaki kekasih Muhammad.',
        latinText:
            "Wa ahabbu maa fii Makkatal haraam, mawdho'u qodamil habiibi Muhammad.",
        sourceNote: 'Syair cinta Nabi SAW — Diba\'',
      ),
      ManaqibSection(
        title: 'Syair — Kelahiran Nabi SAW',
        arabicText:
            'وُلِدَ النَّبِيُّ الْمُصْطَفَى مُحَمَّدٌ فِي لَيْلَةِ الثَّانِي عَشَرَ مِنْ رَبِيعِ الْأَوَّلِ',
        translation:
            'Lahir Nabi Al-Mushthafa Muhammad, pada malam tanggal dua belas bulan Rabiul Awal.',
        latinText:
            "Wulidan nabiyyul Mushthofa Muhammad, fi lailatis tsaanii 'asyar min Robii'il Awwal.",
        sourceNote: 'Kisah kelahiran Nabi SAW — Diba\'',
      ),
      ManaqibSection(
        title: 'Syair — Alam Menjadi Terang',
        arabicText:
            'فَأَضَاءَ مِنْهُ الْعَالَمُ كُلُّهُ وَزَالَتْ عَنْهُ ظُلُمَاتُ الْجَهْلِ وَالضَّلَالِ',
        translation:
            'Maka dengan beliau seluruh alam menjadi terang, dan lenyaplah darinya kegelapan kebodohan dan kesesatan.',
        latinText:
            "Fa adhaa-a minhu 'aalamu kulluh, wa zaalat 'anhu zhulumaatul jahli wadh dholal.",
        sourceNote: 'Kisah kelahiran Nabi SAW — Diba\'',
      ),
      ManaqibSection(
        title: 'Syair — Sifat Nabi SAW',
        arabicText:
            'كَانَ النَّبِيُّ صَلَّى اللّٰهُ عَلَيْهِ وَسَلَّمَ أَحْسَنَ النَّاسِ وَجْهًا وَأَطْيَبَهُمْ رَائِحَةً',
        translation:
            'Nabi shallallahu \'alaihi wasallam adalah manusia yang paling tampan wajahnya dan paling harum baunya.',
        latinText:
            "Kaanan nabiyyu shallallahu 'alaihi wasallam, ahsanan naasi wajhan wa athoyabahum roo-ihah.",
        sourceNote: 'Sifat-sifat Nabi SAW — Diba\'',
      ),
      ManaqibSection(
        title: 'Syair — Paling Dermawan dan Pemberani',
        arabicText:
            'وَأَجْوَدَهُمْ يَدًا وَأَشْجَعَهُمْ قَلْبًا مَا رَآهُ أَحَدٌ إِلَّا أَحَبَّهُ',
        translation:
            'Paling dermawan tangannya dan paling berani hatinya, tidak ada seorang pun yang melihat beliau kecuali pasti mencintainya.',
        latinText:
            "Wa ajwadahum yadan wa asyja'ahum qolbaa, maa roo-aahu ahadun illaa ahabbah.",
        sourceNote: 'Sifat-sifat Nabi SAW — Diba\'',
      ),
      ManaqibSection(
        title: 'Doa — Memohon Cinta kepada Nabi SAW',
        arabicText:
            'اَللّٰهُمَّ ارْزُقْنَا حُبَّ نَبِيِّكَ مُحَمَّدٍ وَحُبَّ مَنْ أَحَبَّهُ وَالْعَمَلَ الَّذِي يُبَلِّغُنَا حُبَّهُ',
        translation:
            'Ya Allah, anugerahkanlah kepada kami kecintaan kepada Nabi-Mu Muhammad, dan kecintaan kepada orang-orang yang mencintai beliau, dan amal yang menghantarkan kami kepada kecintaan beliau.',
        latinText:
            "Allahummor-zuqnaa hubba Nabiyyika Muhammad, wa hubba man ahabbah wal 'amalalladzi yuballighunaa hubbah.",
        sourceNote: 'Doa cinta Nabi — Maulid Diba\'',
      ),
      ManaqibSection(
        title: 'Doa — Memohon Ziarah ke Madinah',
        arabicText:
            'وَارْزُقْنَا زِيَارَتَهُ فِي الدُّنْيَا وَالْآخِرَةِ',
        translation:
            'Dan anugerahkanlah kepada kami ziarah kepada beliau di dunia dan di akhirat.',
        latinText:
            "War-zuqnaa ziyaaratahu fid dunyaa wal aakhirah.",
        sourceNote: 'Doa ziarah — Maulid Diba\'',
      ),
      ManaqibSection(
        title: 'Doa Penutup Maulid Diba\'',
        arabicText:
            'وَالصَّلَاةَ وَالسَّلَامَ عَلَيْهِ وَعَلَى آلِهِ وَصَحْبِهِ أَجْمَعِينَ',
        translation:
            'Serta shalawat dan salam atas beliau, keluarga, dan seluruh sahabatnya.',
        latinText:
            "Wash sholaata was salaama 'alaihi wa 'ala aalihi wa shohbihi ajma'iin.",
        sourceNote: 'Doa penutup — Maulid Diba\'',
      ),
    ],
  ),
];
