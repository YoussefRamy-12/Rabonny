
import 'package:flutter/material.dart';
import 'package:rabonny/constants/app_lists.dart';

import '../constants/constants_vars.dart';
import '../widgets/chapter_selection.dart';

class ChapterSelection extends StatefulWidget {
  const ChapterSelection({super.key});

  @override
  State<ChapterSelection> createState() => ChapterSelectionState();
}

class ChapterSelectionState extends State<ChapterSelection> {
  static int chapterCounter = 46;

  static var chapters = AppLists.namesOfChaptersOldTestament;


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
                    "الكتاب المقدس",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: const BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Text(
                          " العهد القديم",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: MyConstVar.color1),
                        ),
                        onTap: () => setState(() {
                          MyConstVar.color2 = Colors.black;
                          MyConstVar.color1 = Colors.amber;
                          chapterCounter = 46;
                          chapters = AppLists.namesOfChaptersOldTestament;
                        }),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        child: Text(
                          " العهد الجديد",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: MyConstVar.color2),
                        ),
                        onTap: () => setState(() {
                          MyConstVar.color1 = Colors.black;
                          MyConstVar.color2 = Colors.amber;
                          chapterCounter = 27;
                          chapters = AppLists.namesOfChaptersNewTestament;
                        }),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.all(Radius.circular(60))),
                      padding: const EdgeInsets.only(
                          right: 12, bottom: 12, left: 12, top: 9),
                      child: TestamentSelection(
                          chapterCount: chapterCounter,
                          chapters: chapters,
                          )),
                ),
              ],
            ),
          ),
        ));
  }
}
