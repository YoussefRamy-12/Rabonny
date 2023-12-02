import 'package:flutter/material.dart';
import 'package:rabonny/constants/app_lists.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(246, 230, 196, 1),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          InkWell(
                              child: Column(
                                children: [
                                  Image.asset(
                                    AppLists.bookDataArr[1].imgPath,
                                    scale: 3,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    AppLists.bookDataArr[1].bookName,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              onTap: () =>
                                  Navigator.pushNamed(context, "agbyaSelect"))
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          InkWell(
                              child: Column(
                                children: [Image.asset(
                  AppLists.bookDataArr[0].imgPath,
                  scale: 3,
                ),
                const SizedBox(height: 10),
                Text(
                  AppLists.bookDataArr[0].bookName,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                )
                                ],
                              ),
                              onTap: () => Navigator.pushNamed(
                                  context, "holybibleSelect"))
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("الاكثر استخداما",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [Image.asset(
                  AppLists.bookDataArr[0].imgPath,
                  scale: 4,
                ),
                const SizedBox(height: 10),
                Text(
                  AppLists.bookDataArr[0].bookName,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Flexible(
                              child: Text(
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.center,
                                  "الكتاب المقدس يتكون من عهدين قديم وجديد",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w100,
                                  ))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
