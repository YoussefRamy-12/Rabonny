import 'package:flutter/material.dart';
import 'package:rabonny/constants/app_maps.dart';
import 'package:rabonny/constants/constants_vars.dart';
import 'package:rabonny/constants/json_load_data.dart';
import 'package:rabonny/screens/home_page.dart';
import 'package:rabonny/screens/new_testament_reading_page.dart';
import 'package:rabonny/widgets/app_logo.dart';

import 'books_page.dart';
import 'settings_page.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<MainHomePage> {
  @override
  void initState() {
    super.initState();

    JsonOperations.loadData().then((data) {
      setState(() {
        print(AppMaps.oldTestament);
        print(AppMaps.oldTestament["oldTestament"]["takween"][0]["verses"]);
      });
    });
  }

  final screens = [
    const HomePage(),
    const BooksPage(),
    const SettingsPage(),
    const NewTestamentReadingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
          title: const Text("Rabonny",
              style: TextStyle(color: Colors.black, fontSize: 25)),
          backgroundColor: Colors.white,
          elevation: 3.0,
          //  leading: Icon(Icons.menu),
        ),
        drawer: Drawer(
            child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 170, 139, 16)),
                currentAccountPicture: AppLogo.logo,
                accountName: const Text("Rabonny"),
                accountEmail: const Text("Beta Version 2023")),
            
            ListTile(
              title: const Text("الكتاب المقدس"),
              leading: const Icon(Icons.library_books_outlined),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "holybibleSelect");
              },
            ),ListTile(
              title: const Text("الاجبية"),
              leading: const Icon(Icons.library_books_outlined),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "agbyaSelect");
              },
            ),ListTile(
              title: const Text("الخولاجي"),
              leading: const Icon(Icons.library_books_outlined),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "kholagySelect");
              },
            ),ListTile(
              title: const Text("الابصلمودية"),
              leading: const Icon(Icons.library_books_outlined),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "ebsalmodyaSelect");
              },
            ),
          ],
        )),
        backgroundColor: const Color.fromRGBO(246, 230, 196, 1),
        body: screens[MyConstVar.currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    blurStyle: BlurStyle.normal,
                    offset: Offset(0, 6))
              ]),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: BottomNavigationBar(
                selectedIconTheme:
                    const IconThemeData(color: Color.fromRGBO(146, 111, 17, 1)),
                selectedLabelStyle:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                showUnselectedLabels: false,
                selectedItemColor: Colors.black,
                iconSize: 35,
                onTap: (index) => setState(() => MyConstVar.setIndex(index)),
                currentIndex: MyConstVar.currentIndex,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu_book),
                    label: "Books",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: "Settings",
                  )
                ]),
          ),
        ));
  }
}
