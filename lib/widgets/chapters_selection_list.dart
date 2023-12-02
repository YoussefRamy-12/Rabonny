import 'package:flutter/material.dart';

class ChapterSelection extends StatefulWidget {
  const ChapterSelection({super.key});

  @override
  State<ChapterSelection> createState() => ChapterSelectionState();
}

class ChapterSelectionState extends State<ChapterSelection> {
  int? chapterCount ;
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
                    physics: const BouncingScrollPhysics() ,
                      itemCount: chapterCount,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          trailing: const Icon(Icons.check_box),
                          title: Text("الاصحاح ${index+1}"),
                        );
                      });
  }
}