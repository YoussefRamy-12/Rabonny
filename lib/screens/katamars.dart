import 'package:flutter/material.dart';
import 'package:rabonny/constants/app_lists.dart';
import 'package:rabonny/constants/constants_vars.dart';
import 'package:rabonny/constants/settings.dart';
import 'package:swipe/swipe.dart';

import '../constants/app_maps.dart';

class KatamarsReadingPage extends StatefulWidget {
  const KatamarsReadingPage({super.key});

  @override
  State<KatamarsReadingPage> createState() => _KatamarsReadingPageState();
}

class _KatamarsReadingPageState extends State<KatamarsReadingPage> {
  DateTime dateTime = DateTime.now();
  ScrollController scrollController = ScrollController();


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
          title: const Text("القطمارس",
              style: TextStyle(color: Colors.black, fontSize: 25)),
          backgroundColor: Colors.white,
          elevation: 3.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: const Color.fromRGBO(246, 230, 196, 1),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () async {
                final date = await pickDate();
                if (date == null)return;
                setState(() => dateTime = date);
              }, child: Text("${dateTime.day}/${dateTime.month}/${dateTime.year}")),
              Expanded(
                child: Swipe(
                  onSwipeRight: () => setState(() {
                    // if () {
                    // } else {
                    // }
                    // scrollController.jumpTo(0.0);
                  }),
                 onSwipeLeft : () => setState(() {
                    // if (MyConstVar.es7a7Counter >= 1 &&
                    //     MyConstVar.es7a7Counter < salaLenght) {
                    //   MyConstVar.es7a7Counter++;
                    //   salaselectedValue = MyConstVar.es7a7Counter;
                    // }
                    // scrollController.jumpTo(0.0);
                  }),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Text(
                        AppMaps.agbya["agbya"][AppLists
                                .namesOfSalaot[MyConstVar.selectedChapter]]
                            [MyConstVar.es7a7Counter]["text"]+'''




//////
نعمل علي هذا الجزء
//////
''',
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.clip,
                        style:  TextStyle(
                          fontSize: Settings.appFontSize,
                          fontWeight: Settings.appFontWeight,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
  Future<DateTime?>pickDate()=>showDatePicker(context: context
  , initialDate:dateTime, firstDate:DateTime(1900), lastDate:DateTime(2100));
}
