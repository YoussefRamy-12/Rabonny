// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

import '../constants/constants_vars.dart';

class TestamentSelection extends StatelessWidget {
  final int chapterCount;
  var chapters;

  final void Function()? onTap;

  TestamentSelection(
      {super.key,
      required this.chapterCount,
      required this.chapters,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: chapterCount,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 2.0, color: Color.fromARGB(255, 165, 153, 97)),
              ),
            ),
            child: ListTile(
              title: Text(chapters[index],
                  textDirection: TextDirection.rtl,
                  textScaleFactor: 1.5,
                  textAlign: TextAlign.center),
              onTap: () {
                if (chapterCount == 27) {
                  Navigator.pushReplacementNamed(context, "newTetament");
                  MyConstVar.selectedChapter = index;
                } else if (chapterCount == 46) {
                  Navigator.pushReplacementNamed(context, "oldTestament");
                  MyConstVar.selectedChapter = index;
                } else if (chapterCount == 8) {
                  Navigator.pushReplacementNamed(context, "agbya");
                  MyConstVar.selectedChapter = index;
                } else if (chapterCount == 5) {
                  Navigator.pushReplacementNamed(context, "kholagy");
                  MyConstVar.selectedChapter = index;
                }else if (chapterCount == 7) {
                  Navigator.pushReplacementNamed(context, "ebsalmodya");
                  MyConstVar.selectedChapter = index;
                }
              },
            ),
          );
        });
  }
}
