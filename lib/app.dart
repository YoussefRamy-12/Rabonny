import 'package:flutter/material.dart';
import 'package:rabonny/screens/ebsalmodya_reading_page.dart';
import 'package:rabonny/screens/kholagy_reading_page.dart';
import 'package:rabonny/screens/kholagy_select_page.dart';
import 'package:rabonny/screens/main_home_page.dart';

// import 'package:rabonny/screens/main_home_page.dart';
import 'package:rabonny/screens/new_testament_reading_page.dart';

import 'screens/agbya_reading_page.dart';
import 'screens/agbya_select_page.dart';
import 'screens/chapter_select_page.dart';
import 'screens/ebsalmodya_select_page.dart';
import 'screens/home_page.dart';
import 'screens/katamars.dart';
import 'screens/old_testament_reading_page.dart';
// import 'package:rabonny/screens/home_page';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainHomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        "homePage": (context) => const HomePage(),
        "oldTestament": (context) => const OldTestamentReadingPage(),
        "newTetament": (context) => const NewTestamentReadingPage(),
        "holybibleSelect": (context) => const ChapterSelection(),
        "agbyaSelect": (context) => const AgbyaSelection(),
        "agbya": (context) => const AgbyaReadingPage(),
        "kholagySelect": (context) => const KholagySelection(),
        "kholagy": (context) => const KholagyReadingPage(),
        "ebsalmodyaSelect": (context) => const EbsalmodyaSelection(),
        "ebsalmodya": (context) => const EbsalmodyaReadingPage(),
        "katamars": (context) => const KatamarsReadingPage(),
      },
    );
  }
}
