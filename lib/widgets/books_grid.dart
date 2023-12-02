// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:rabonny/constants/app_lists.dart';

class MyBooksGrid extends StatelessWidget {
  const MyBooksGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 50),
      itemBuilder: (context, index) => GridTile(
        child: InkWell(
            child: Column(
              children: [
                Image.asset(
                  AppLists.bookDataArr[index].imgPath,
                  scale: 3,
                ),
                const SizedBox(height: 10),
                Text(
                  AppLists.bookDataArr[index].bookName,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                )
              ],
            ),
            onTap: () => Navigator.pushNamed(context, AppLists.bookDataArr[index].bookPushNamed)),
      ),
      itemCount: 5,
    );
  }
}
