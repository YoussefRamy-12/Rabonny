import 'package:flutter/material.dart';

import '../constants/constants_vars.dart';

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({super.key, required List<BottomNavigationBarItem> items, required int currentIndex, required void Function(dynamic index) onTap});

  @override
  State<BottomNavigationBar> createState() => BbottomNavigationBarState();
}

class BbottomNavigationBarState extends State<BottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          onTap: (index) => setState(() => MyConstVar.setIndex(index)),
          currentIndex: MyConstVar.currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "Home",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book),
                label: "Books",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
                backgroundColor: Colors.black)
          ]);
  }
}