

import 'package:flutter/material.dart';
import 'package:rabonny/constants/app_lists.dart';
import '../widgets/chapter_selection.dart';

class KholagySelection extends StatefulWidget {
  const KholagySelection({super.key});

  @override
  State<KholagySelection> createState() => KholagySelectionState();
}

class KholagySelectionState extends State<KholagySelection> {
  static int chapterCounter = 8;

  static var chapters = AppLists.kholagySections;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(246, 230, 196, 1),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: const Text(
                    "الخولاجي",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.all(Radius.circular(60))),
                      padding: const EdgeInsets.only(
                          right: 12, bottom: 12, left: 12, top: 9),
                      child: TestamentSelection(
                          chapterCount: AppLists.kholagySections.length,
                          chapters: chapters,
                          )),
                ),
              ],
            ),
          ),
        ));
  }
}
