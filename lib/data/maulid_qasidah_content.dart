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
    arabicTitle: 'البرنجي',
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
            'يَا أَشْرَفَ الْخَلْقِ وَأَكْرَمَ الرَّسُولِ\nمَنْ لَمْ يَكُنْ لَهُ نَظِيرٌ فِي الْأَصْلِ وَالْفَصْلِ',
        translation:
            'Wahai seagung-agung makhluk dan semulia-mulia rasul. Yang tidak ada bandingannya dalam asal maupun keturunan.',
        latinText:
            'Ya asyrofal kholqi wa akromar rosuul. Man lam yakun lahu nazhiirun fil ashli wal fashl.',
        sourceNote: 'Pembuka Barzanji — pujian kepada Nabi SAW',
      ),
      ManaqibSection(
        title: 'Pujian kepada Nabi Muhammad SAW',
        arabicText:
            'يَا رَسُولَ اللّٰهِ يَا مُخْتَارَ اللّٰهِ\nيَا حَبِيبَ اللّٰهِ يَا خَيْرَ خَلْقِ اللّٰهِ\nأَنْتَ الشَّفِيعُ يَوْمَ الْقِيَامَةِ\nوَأَنْتَ صَاحِبُ الْحَوْضِ وَاللِّوَاءِ',
        translation:
            'Wahai utusan Allah, wahai pilihan Allah. Wahai kekasih Allah, wahai sebaik-baik makhluk Allah. Engkaulah pemberi syafaat di hari kiamat. Dan engkaulah pemilik telaga dan bendera.',
        latinText:
            "Ya Rasulallah ya Mukhtarallah. Ya Habiballah ya Khoiro kholqillah. Antasy-syafii'u yaumal qiyaamah. Wa anta shohibul haudhi wal liwaa'.",
        sourceNote: 'Sanjungan kepada Nabi SAW — Barzanji',
      ),
      ManaqibSection(
        title: 'Silsilah / Nasab Nabi SAW',
        arabicText:
            'عَبْدُ اللّٰهِ ثُمَّ عَبْدُ الْمُطَّلِبِ\nوَهَاشِمٍ ثُمَّ عَبْدِ مَنَافِ\nفَإِنَّ نَسَبَ الْمُصْطَفَى مِنْ أَشْرَفِ النَّسَبِ\nشَرُفَتْ بِهِ الْعَرَبُ وَمَضَرُ وَرَبِيعَةُ',
        translation:
            '(Putra) Abdullah, kemudian Abdul Muththalib, dan Hasyim, kemudian Abdu Manaf. Sesungguhnya nasab Al-Mushthafa (Nabi SAW) termasuk nasab yang paling mulia.',
        latinText:
            "Abdullahi tsumma Abdul Muththalib. Wa Hasyimin tsumma Abdi Manaf. Fa inna nasabal Mushthofa min asyrofin nasab. Syarafat bihil 'arobu wa Mudhoru wa Robii'ah.",
        sourceNote: 'Silsilah keturunan Nabi SAW — Barzanji',
      ),
      ManaqibSection(
        title: 'Kelahiran Nabi Muhammad SAW',
        arabicText:
            'وُلِدَ الْمُسْتَفَى بِمَكَّةَ فِي رَبِيعِ الْأَوَّلِ\nعَامَ الْفِيلِ فِي الثَّانِي عَشَرَ\nأَشْرَقَتِ الْأَرْضُ بِنُورِهِ وَبِهِجَتِهِ\nوَاكْتَسَتِ السَّمَاءُ زِينَةً وَسُرُورًا',
        translation:
            'Al-Mushthafa lahir di Makkah pada bulan Rabiul Awal. Tahun Gajah, pada tanggal dua belas. Bumi menjadi terang dengan cahaya dan kegembiraan beliau.',
        latinText:
            "Wulidal Musthofa bi Makkata fi Robii'il Awwal. 'Aamal Fiili fits tsaanii 'asyar. Asyroqotil ardhu binuurihi wa bahijatih. Waktasatis samaa-u ziinatan wa suruuraa.",
        sourceNote: 'Kisah kelahiran Nabi SAW — Barzanji',
      ),
      ManaqibSection(
        title: 'Pengasuhan Halimah Sa\'diah',
        arabicText:
            'أَرْضَعَتْهُ حَلِيمَةُ السَّعْدِيَّةُ\nفَكَانَ مِنْ يَوْمِ وِلَادَتِهِ مُبَارَكًا\nزَادَتِ الْبَرَكَاتُ فِي ضَيْعَتِهَا\nوَخَصَّبَ الْعُشْبُ وَالضَّرْعُ',
        translation:
            'Halimah As-Sa\'diah menyusui beliau. Maka sejak hari kelahirannya beliau sudah penuh berkah. Berkah bertambah di tempat tinggalnya.',
        latinText:
            "Arlo'at-hu Haliimatus Sa'diyyah. Fakaana min yaumi wiladatihi mubaarokaa. Zaaatil barokaatu fii dhoi'atihaa. Wa khoshobal 'usybu wadhdhor'u.",
        sourceNote: 'Masa pengasuhan Halimah — Barzanji',
      ),
      ManaqibSection(
        title: 'Syi\'rul Maut (Sya\'ir Kematian)',
        arabicText:
            'يَا نَفْسُ مِيتِي قَبْلَ أَنْ تَمُوتِي\nفَالْمَوْتُ آتٍ لَا مَحَالَةَ آتِ\nيَا رَبِّ تَقَبَّلْ تَوْبَتِي وَارْحَمْنِي\nفَأَنْتَ رَبِّي وَأَنَا عَبْدُكَ الضَّعِيفُ',
        translation:
            'Wahai jiwa, matilah sebelum kau mati. Sebab kematian itu pasti datang tak terelakkan. Ya Allah, terimalah taubatku dan rahmatilah aku.',
        latinText:
            "Yaa nafsu miitii qobla an tamuutii. Fal mautu aatin laa mahaalata aati. Ya Robbi taqobbal taubatii warhamni. Fa Anta Robbii wa anaa 'abdu-kadh dho'iif.",
        sourceNote: 'Sya\'ir Kematian — bagian penutup Barzanji',
      ),
      ManaqibSection(
        title: 'Doa Penutup Barzanji',
        arabicText:
            'اَللّٰهُمَّ صَلِّ وَسَلِّمْ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ أَجْمَعِينَ\nرَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
        translation:
            'Ya Allah, limpahkanlah shalawat dan salam kepada junjungan kami Muhammad serta keluarga dan sahabatnya seluruhnya. Ya Tuhan kami, berikanlah kebaikan di dunia dan kebaikan di akhirat.',
        latinText:
            "Allahumma shalli wasallim 'ala sayyidina Muhammad wa 'ala aalihi wa shohbihi ajma'iin. Robbanaa aatinaa fid dunyaa hasanah wa fil aakhirati hasanah wa qinaa 'adzaaban naar.",
        sourceNote: 'Doa penutup — Al-Baqarah: 201 + shalawat',
      ),
    ],
  ),

  // ═══════════════════════════════════════════════════════
  // SIMTUDDUROR — Simtudduror
  // ═══════════════════════════════════════════════════════
  Manaqib(
    id: 102,
    title: 'Simtudduror',
    arabicTitle: 'سمط الدرر',
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
            'اَللّٰهُمَّ صَلِّ وَسَلِّمْ عَلَى سَيِّدِنَا مُحَمَّدٍ صَلَاةً تُنْجِيْنَا بِهَا مِنْ جَمِيْعِ الْأَهْوَالِ وَالْآفَاتِ\nوَتَقْضِيْ لَنَا بِهَا جَمِيْعَ الْحَوَائِجِ\nوَتُطَهِّرُنَا بِهَا مِنْ جَمِيْعِ السَّيِّئَاتِ',
        translation:
            'Ya Allah, limpahkanlah shalawat dan salam kepada junjungan kami Muhammad, shalawat yang menyelamatkan kami dari segala ketakutan dan bencana.',
        latinText:
            "Allahumma shalli wasallim 'ala sayyidina Muhammad sholaatan tunjiinaa bihaa min jamii'il ahwaali wal aafaat. Wa taqdhii lanaa bihaa jamii'al hawaa-ij. Wa tuthohhirunaa bihaa min jamii'is sayyi-aat.",
        sourceNote: 'Shalawat pembuka Simtudduror',
      ),
      ManaqibSection(
        title: 'Pujian — Ya Rahman Ya Rahim',
        arabicText:
            'يَا رَحْمٰنُ يَا رَحِيمُ\nيَا كَرِيمُ يَا عَظِيمُ يَا عَلِيمُ\nيَا مَنْ لَا يَفْتَحُ أَحَدٌ مَا أَغْلَقَ وَلَا يُغْلِقُ مَا فَتَحَ إِلَّا اللهُ\nصَلِّ وَسَلِّمْ عَلَى سَيِّدِنَا مُحَمَّدٍ',
        translation:
            'Wahai Yang Maha Pengasih, Wahai Yang Maha Penyayang. Wahai Yang Maha Mulia, Wahai Yang Maha Agung, Wahai Yang Maha Mengetahui. Limpahkanlah shalawat dan salam kepada junjungan kami Muhammad.',
        latinText:
            "Ya Rohmaanu ya Rohiim. Ya Kariimu ya 'Azhiimu ya 'Aliim. Ya man laa yaftahu ahadun maa aghlaqo wa laa yughliqu maa fatahaa illallah. Shalli wasallim 'ala sayyidina Muhammad.",
        sourceNote: 'Asmaul Husna + shalawat — Simtudduror',
      ),
      ManaqibSection(
        title: 'Syair — Nur Muhammad',
        arabicText:
            'نُورُ نَبِيِّ اللّٰهِ قَبْلَ الْخَلْقِ كُلِّهِمْ\nظَهَرَ فِي الْأَفَاقِ وَفِي الْأَرْضِ وَالسَّمَاءِ\nهُوَ الْحَبِيبُ الَّذِي يُرْجَى شَفَاعَتُهُ\nلِكُلِّ هَوْلٍ مِنَ الْأَهْوَالِ مُقْتَحَمُ',
        translation:
            'Cahaya Nabi Allah telah ada sebelum seluruh makhluk. Terlihat di ufuk, di bumi dan di langit. Dialah kekasih yang diharapkan syafaatnya.',
        latinText:
            "Nuuru Nabiyyillah qoblal kholqi kullihim. Zhoharo fil afaaqi wa fil ardhi was samaa'. Huwal habiibulladzi yurjaa syafaa'atuh. Likulli hawlin minal ahwaali muqtaham.",
        sourceNote: 'Syair Nur Muhammad — Simtudduror',
      ),
      ManaqibSection(
        title: 'Syair — Kelahiran Nabi SAW',
        arabicText:
            'فِي لَيْلَةِ الثَّانِي عَشَرَ مِنْ رَبِيعِ الْأَوَّلِ\nوُلِدَ الْحَبِيبُ الْمُصْطَفَى مُحَمَّدٌ\nأَشْرَقَتِ الدُّنْيَا بِنُورِ وَجْهِهِ\nوَفَرِحَتِ الْمَلَائِكَةُ وَالسَّمَاوَاتُ',
        translation:
            'Pada malam tanggal dua belas bulan Rabiul Awal. Lahir sang kekasih Al-Mushthafa Muhammad. Dunia menjadi terang dengan cahaya wajahnya.',
        latinText:
            "Fi lailatis tsaanii 'asyar min Robii'il Awwal. Wulidal habiibul Mushthofa Muhammad. Asyroqotid dunyaa binuuri wajhihi. Wa farihatil malaa-ikatu was samaawaat.",
        sourceNote: 'Kisah kelahiran Nabi SAW — Simtudduror',
      ),
      ManaqibSection(
        title: 'Syair — Akhlak Nabi SAW',
        arabicText:
            'مَا رُئِيَ فِي الْوُجُودِ مِثْلُهُ\nوَلَا سُمِعَ فِي الْخَلَائِقِ نَظِيرُهُ\nكَانَ خُلُقُهُ الْقُرْآنُ الْعَظِيمُ\nأَحْسَنُ النَّاسِ خُلُقًا وَخَلْقًا',
        translation:
            'Tidak pernah ada yang semisal dengannya di alam wujud ini. Akhlak beliau adalah Al-Quran Al-Azhim. Yang paling baik akhlak dan rupanya di antara manusia.',
        latinText:
            "Maa ru-iya fil wujuudi misluh. Wa laa sumi'a fil kholaa-iqi nazhiiruh. Kaana khuluquhul qur-aanal 'azhiim. Ahsanun naasi khuluqon wa kholqaa.",
        sourceNote: 'Pujian akhlak Nabi SAW — Simtudduror',
      ),
      ManaqibSection(
        title: 'Doa Penutup Simtudduror',
        arabicText:
            'اَللّٰهُمَّ اغْفِرْ لَنَا وَلِإِخْوَانِنَا الَّذِينَ سَبَقُونَا بِالْإِيمَانِ\nوَلَا تَجْعَلْ فِي قُلُوبِنَا غِلًّا لِلَّذِينَ آمَنُوا\nرَبَّنَا إِنَّكَ رَؤُوفٌ رَحِيمٌ',
        translation:
            'Ya Allah, ampunilah kami dan saudara-saudara kami yang telah mendahului kami dalam keimanan. Ya Tuhan kami, sesungguhnya Engkau Maha Pengasih lagi Maha Penyayang.',
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
    arabicTitle: 'القصيدة البردة',
    description:
        'Qasidah Al-Burdah (Syair Selendang) — mahakarya Imam Al-Bushiri berisi pujian mendalam kepada Nabi Muhammad SAW.',
    category: 'Maulid & Qasidah',
    source: 'Kitab Al-Burdah, Imam Syarafuddin Al-Bushiri (w. 695 H)',
    validityNote:
        'Qasidah Al-Burdah (Al-Kawakib Ad-Durriyyah fi Madh Khair Al-Bariyyah) disusun oleh Imam Muhammad bin Sa\'id Al-Bushiri (w. 695 H/1294 M). Kisah terkenal: Imam Al-Bushiri lumpuh lalu bermimpi Nabi SAW menyelimutinya dengan burdah (selendang), dan beliau sembuh. Di sini kami sajikan bait-bait terpilih.',
    sections: [
      ManaqibSection(
        title: 'Bait 1-2 — Amr (Kerinduan)',
        arabicText:
            'أَمِنْ تَذَكُّرِ جِيرَانٍ بِذِي سَلَمِ\nمَزَجْتَ دَمْعًا جَرَى مِنْ مُقْلَةٍ بِدَمِ\nأَمْ هَبَّتِ الرِّيحُ مِنْ تِلْقَاءِ كَاظِمَةٍ\nوَأَوْمَضَ الْبَرْقُ فِي الظَّلْمَاءِ مِنْ إِضَمِ',
        translation:
            'Apakah karena teringat tetangga di Dzi Salam. Kau campurkan air mata yang mengalir dari mata dengan darah. Ataukah angin berhembus dari arah Kazhimah.',
        latinText:
            "Am min tadzakkuri jiiraanin bidzi salami. Mazaqta dam'an jaraa min muqlatin bidami. Am habbatis riihu min tilqaa-i kazhimah. Wa awmadhol barqu fidh dholamaa-i min idham.",
        sourceNote: 'Bait 1-2 — Pembuka Al-Burdah (Fashl Amr)',
      ),
      ManaqibSection(
        title: 'Bait 3-4 — Kerinduan yang Membara',
        arabicText:
            'فَمَا لِعَيْنَيْكَ إِنْ قُلْتَ اكْفُفَا هَمَتَا\nوَمَا لِقَلْبِكَ إِنْ قُلْتَ اسْتَفِقْ يَهِمِ\nأَيَحْسَبُ الْحُزْنُ وَالشَّوْقُ مُنْكِفَأَ\nوَالدَّمْعُ إِنْ كَفَّ يَوْمًا عَنِ الْهُجُومِ',
        translation:
            'Mengapa kedua matamu — jika kau berkata "tahanlah" — tetap mengalir? Mengapa hatimu — jika kau berkata "sadarlah" — tetap rindu?',
        latinText:
            "Famaa li 'ainika in qultakfufaa hamataa. Wa maa liqolbika in qultas-tafiq yahimi. Ayahtsabul huznu wasy-syauqu munkafi-a. Wad-dam'u in kaffa yauman 'anil hujuum.",
        sourceNote: 'Bait 3-4 — Kerinduan kepada Madinah',
      ),
      ManaqibSection(
        title: 'Bait 20-21 — Pujian kepada Nabi SAW',
        arabicText:
            'ذُكِرَ النَّبِيُّ فَهَاجَ الشَّوْقُ وَاشْتَعَلَتْ\nنَارُ الْحَنِينِ وَهَاجَتْ دَمْعَةً بِعَمِي\nمَوْلَايَ صَلِّ وَسَلِّمْ أَبَدًا عَلَى\nخَيْرِ الْبَرِيَّةِ طُرًّا سَيِّدِ الْأُمَمِ',
        translation:
            'Ketika Nabi disebut, kerinduan pun bergelora. Api kecintaan menyala. Wahai Tuhanku, limpahkanlah shalawat dan salam selamanya kepada sebaik-baik seluruh makhluk.',
        latinText:
            "Dzikiran nabiyyu fahaajas syauqu wasy-ta'alat. Naarul haniini wa haajat dam'atan bi'amii. Mawlaaya shalli wasallim abadan 'alaa. Khoiril bariyyati thorron sayyidil umam.",
        sourceNote: 'Bait 20-21 — Shalawat dalam Al-Burdah',
      ),
      ManaqibSection(
        title: 'Bait 30 — Nasab Nabi SAW',
        arabicText:
            'أَبْدَى لَهُ الْعَدْلُ مِنْ صُلْبٍ إِلٰى صُلُبٍ\nسِرًّا مِنَ السِّرِّ بَدَّاهُ مِنَ الْعَدَمِ\nخَيْرُ الْأَنَامِ وَخَيْرُ الرُّسْلِ أَجْمَعِينَ\nمُحَمَّدٌ سَيِّدُ الْكَوْنَيْنِ وَالثَّقَلَيْنِ',
        translation:
            'Keadilan menunjukkan kepadanya — dari tulang sulbi ke tulang sulbi. Sebaik-baik manusia dan sebaik-baik seluruh rasul. Muhammad, pemimpin dua alam.',
        latinText:
            "Abdaa lahul 'adlu min shulbin ilaa shulub. Sirran minas sirri baddaahu minal 'adami. Khoirul anaami wa khoirur rusli ajma'iin. Muhammadun sayyidul kaunaini wats tsaqalain.",
        sourceNote: 'Bait 30 — Nasab Nabi dalam Al-Burdah',
      ),
      ManaqibSection(
        title: 'Bait 51-52 — Ilmu dan Ma\'rifat',
        arabicText:
            'وَلَهُمْ مِنَ الْعُلُومِ سَهْمٌ أَصَابَهُمْ\nمِنْ فَضْلِ رَبِّهِمُ بِغَيْرِ احْتِسَابِ\nوَلَوْ لَمَّا يَكُنْ لَهُمْ مِنْ عِلْمِهِمْ أَحَدٌ\nلَكَفَاهُمُ عِلْمًا بِأَنَّهُمْ عِبَادِي',
        translation:
            'Dan mereka mendapat bagian ilmu. Dari keutamaan Tuhan mereka tanpa mereka duga. Cukuplah bagi mereka ilmu bahwa mereka adalah hamba-hamba-Ku.',
        latinText:
            "Wa lahum minal 'uluumi sahmun ashoobahum. Min fadhli Rabbihim bighairi ihtisaab. Wa law lammaa yakun lahum min 'ilmihim ahad. Lakafaahum 'ilman bi annahum 'ibaadii.",
        sourceNote: 'Bait 51-52 — Ilmu dan ma\'rifat dalam Al-Burdah',
      ),
      ManaqibSection(
        title: 'Bait 80 — Memohon Syafaat',
        arabicText:
            'يَا أَكْرَمَ الرُّسْلِ مَا لِي مَنْ أَلُوذُ بِهِ\nسِوَاكَ عِنْدَ حُلُولِ الْحَادِثِ الْعَمِمِ\nإِنَّ لِي مِنَ الذُّنُوبِ ثِقَالًا\nوَأَنَا أَرْجُو عَفْوَ اللّٰهِ وَالْكَرَمِ',
        translation:
            'Wahai seagung-agung para rasul, aku tak punya tempat berlindung selain dirimu. Ketika peristiwa besar terjadi. Sesungguhnya dosa-dosaku sungguh berat.',
        latinText:
            "Ya akromar rusli maa lii man aluudzu bih. Siwaaka 'inda huluulil haaditsil 'amim. Inna llaya minadz dzunuubi tsiqoolaa. Wa anaa arjuu 'afwallaahi wal karam.",
        sourceNote: 'Bait 80 — Memohon syafaat Nabi SAW',
      ),
      ManaqibSection(
        title: 'Bait 159-160 — Doa Penutup',
        arabicText:
            'وَأَلْحِقَنْ جَارِي بِجِيرَانِ الْحِمَى\nفَإِنَّهُمْ أَهْلُ التُّقَى وَالنُّسُكِ\nوَصَلِّ رَبِّ عَلَى حَبِيبِكَ مُسْتَجَابًا\nبِهَا الدُّعَاءُ مُحَمَّدٍ ذِي الْكَرَمِ',
        translation:
            'Dan sertakanlah kami dengan para tetangga Tanah Suci. Karena mereka adalah ahli taqwa dan ibadah. Dan limpahkanlah shalawat kepada kekasih-Mu.',
        latinText:
            "Wa alhiqan jaarii bijiiraanil himaa. Fa innahum ahlut tuqaa wan nusuk. Wa shalli Rabbi 'ala habiibika mustajaabaa. Bihad du'aa-u Muhammadin dzil karam.",
        sourceNote: 'Bait 159-160 — Penutup Qasidah Al-Burdah',
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
            'اَلْحَمْدُ لِلّٰهِ رَبِّ الْعَالَمِينَ\nحَمْدًا يُوَافِي نِعَمَهُ وَيُكَافِئُ مَزِيدَهُ\nيَا رَبِّ صَلِّ وَسَلِّمْ عَلَى سَيِّدِنَا مُحَمَّدٍ\nالنُّورِ السَّارِي وَالسِّرِّ الَّذِي فِي الْقَلْبِ قَدْ أُودِعَا',
        translation:
            'Segala puji bagi Allah Tuhan seluruh alam. Pujian yang sepadan dengan nikmat-nikmat-Nya. Ya Tuhan kami, limpahkanlah shalawat dan salam kepada junjungan kami Muhammad. Cahaya yang menyinari dan rahasia yang tersimpan di dalam hati.',
        latinText:
            "Alhamdulillah Rabbil 'aalamiin. Hamdan yuwaafii ni'amahu wa yukaafi-u maziidah. Yaa Rabbi shalli wasallim 'ala sayyidina Muhammad. An nuuris saarii was sirril ladzii fil qolbi qod uudi'aa.",
        sourceNote: "Pembuka Maulid Diba'",
      ),
      ManaqibSection(
        title: 'Shalawat Awal',
        arabicText:
            'صَلَاةً تُنْجِينَا مِنْ جَمِيْعِ الْأَهْوَالِ وَالْآفَاتِ\nوَتَقْضِيْ لَنَا بِهَا جَمِيْعَ الْحَوَائِجِ\nوَتُطَهِّرُنَا بِهَا مِنْ جَمِيْعِ السَّيِّئَاتِ\nوَتَرْفَعُنَا بِهَا عِنْدَكَ أَعْلَى الدَّرَجَاتِ',
        translation:
            'Shalawat yang menyelamatkan kami dari segala ketakutan dan bencana. Dan memenuhi segala kebutuhan kami. Dan menyucikan kami dari segala keburukan.',
        latinText:
            "Sholaatan tunjiinaa min jamii'il ahwaali wal aafaat. Wa taqdhii lanaa bihaa jamii'al hawaa-ij. Wa tuthohhirunaa bihaa min jamii'is sayyi-aat. Wa tarfa'unaa bihaa 'indaka a'lad darajaat.",
        sourceNote: "Shalawat awal — Maulid Diba'",
      ),
      ManaqibSection(
        title: 'Syair — Cinta kepada Makkah & Nabi',
        arabicText:
            'أَحَبُّ الْبِلَادِ إِلَيَّ مَكَّةُ\nلِأَنَّ فِيهَا بَيْتَ اللّٰهِ الْحَرَامِ\nوَأَحَبُّ مَا فِي مَكَّةَ الْحَرَامِ\nمَوْضِعُ قَدَمِ الْحَبِيبِ مُحَمَّدٍ',
        translation:
            'Negeri yang paling aku cintai adalah Makkah. Karena di dalamnya terdapat Baitullah Al-Haram. Dan yang paling aku cintai adalah tempat berpijaknya kaki kekasih Muhammad.',
        latinText:
            "Ahabbul bilaadi ilayya Makkah. Li anna fiihaa Baitallahil haraam. Wa ahabbu maa fii Makkatal haraam. Mawdho'u qodamil habiibi Muhammad.",
        sourceNote: "Syair cinta kepada Makkah & Nabi SAW — Diba'",
      ),
      ManaqibSection(
        title: 'Syair — Kelahiran Nabi SAW',
        arabicText:
            'وُلِدَ النَّبِيُّ الْمُصْطَفَى مُحَمَّدٌ\nفِي لَيْلَةِ الثَّانِي عَشَرَ مِنْ رَبِيعِ الْأَوَّلِ\nفَأَضَاءَ مِنْهُ الْعَالَمُ كُلُّهُ\nوَزَالَتْ عَنْهُ ظُلُمَاتُ الْجَهْلِ وَالضَّلَالِ',
        translation:
            'Lahir Nabi Al-Mushthafa Muhammad. Pada malam tanggal dua belas bulan Rabiul Awal. Maka dengan beliau seluruh alam menjadi terang.',
        latinText:
            "Wulidan nabiyyul Mushthofa Muhammad. Fi lailatis tsaanii 'asyar min Robii'il Awwal. Fa adhaa-a minhu 'aalamu kulluh. Wa zaalat 'anhu zhulumaatul jahli wadh dholal.",
        sourceNote: "Kisah kelahiran Nabi SAW — Diba'",
      ),
      ManaqibSection(
        title: 'Syair — Sifat-sifat Nabi SAW',
        arabicText:
            'كَانَ النَّبِيُّ صَلَّى اللّٰهُ عَلَيْهِ وَسَلَّمَ\nأَحْسَنَ النَّاسِ وَجْهًا وَأَطْيَبَهُمْ رَائِحَةً\nوَأَجْوَدَهُمْ يَدًا وَأَشْجَعَهُمْ قَلْبًا\nمَا رَآهُ أَحَدٌ إِلَّا أَحَبَّهُ',
        translation:
            'Nabi shallallahu \'alaihi wasallam adalah manusia yang paling tampan wajahnya dan paling harum baunya. Paling dermawan dan paling berani. Tidak ada yang melihat beliau kecuali pasti mencintainya.',
        latinText:
            "Kaanan nabiyyu shallallahu 'alaihi wasallam. Ahsanan naasi wajhan wa athoyabahum roo-ihah. Wa ajwadahum yadan wa asyja'ahum qolbaa. Maa roo-aahu ahadun illaa ahabbah.",
        sourceNote: "Sifat-sifat Nabi SAW — Diba'",
      ),
      ManaqibSection(
        title: "Doa Penutup Maulid Diba'",
        arabicText:
            'اَللّٰهُمَّ ارْزُقْنَا حُبَّ نَبِيِّكَ مُحَمَّدٍ\nوَحُبَّ مَنْ أَحَبَّهُ وَالْعَمَلَ الَّذِي يُبَلِّغُنَا حُبَّهُ\nوَارْزُقْنَا زِيَارَتَهُ فِي الدُّنْيَا وَالْآخِرَةِ\nوَالصَّلَاةَ وَالسَّلَامَ عَلَيْهِ وَعَلَى آلِهِ وَصَحْبِهِ أَجْمَعِينَ',
        translation:
            'Ya Allah, anugerahkanlah kepada kami kecintaan kepada Nabi-Mu Muhammad. Dan kecintaan kepada orang-orang yang mencintai beliau. Dan ziarah kepada beliau di dunia dan akhirat.',
        latinText:
            "Allahummor-zuqnaa hubba Nabiyyika Muhammad. Wa hubba man ahabbah wal 'amalalladzi yuballighunaa hubbah. War-zuqnaa ziyaaratahu fid dunyaa wal aakhirah. Wash sholaata was salaama 'alaihi wa 'ala aalihi wa shohbihi ajma'iin.",
        sourceNote: "Doa penutup Maulid Diba'",
      ),
    ],
  ),
];
