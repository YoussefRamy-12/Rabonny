// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../widgets/books_grid.dart';
// import 'package:rabonny/screens/reading_page.dart';

// import '../constants/constants_vars.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(246, 230, 196, 1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: MyBooksGrid(),
        ),
      ),
    );
  }
}

