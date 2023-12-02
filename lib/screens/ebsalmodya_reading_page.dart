import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:rabonny/constants/app_lists.dart';
import 'package:rabonny/constants/app_maps.dart';
import 'package:rabonny/constants/constants_vars.dart';
import 'package:rabonny/constants/settings.dart';
import 'package:rabonny/widgets/app_logo.dart';
import 'package:swipe/swipe.dart';

class EbsalmodyaReadingPage extends StatefulWidget {
  const EbsalmodyaReadingPage({super.key});

  @override
  State<EbsalmodyaReadingPage> createState() => _EbsalmodyaReadingPageState();
}

class _EbsalmodyaReadingPageState extends State<EbsalmodyaReadingPage> {
  String? sefrSelectedVal =
      AppLists.ebsalmodyaSections[MyConstVar.selectedChapter];

  int mapIndex = 0;

  int es7a7selectedValue = MyConstVar.es7a7Counter;

  int es7a7Length = AppMaps.ebsalmodya["ebsalmodya"]
      [AppLists.ebsalmodyaSections[MyConstVar.selectedChapter]][0]["total"];

  List<int> sefrSelectedNum = List.generate(
      AppMaps.ebsalmodya["ebsalmodya"]
          [AppLists.ebsalmodyaSections[MyConstVar.selectedChapter]][0]["total"],
      (index) => index,
      growable: true);

  @override
  void initState() {
    super.initState();
    setState(() {
      MyConstVar.es7a7Counter = 1;
      es7a7selectedValue = MyConstVar.es7a7Counter;
      sefrSelectedNum = List.generate(
          AppMaps.ebsalmodya["ebsalmodya"][AppLists.ebsalmodyaSections[mapIndex]][0]
              ["total"],
          (index) => index,
          growable: true);
    });
  }

  @override
  void dispose() {
    super.dispose();
    // Deregister from listening to events.
    // Dispose of any managed state.
  }

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
        title: const Text("الأبصلمودية",
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(child: AppLogo.logo),
              ////////////////////////////   sefr dropdown button
              Center(
                child: DropdownButton2<String>(
                  dropdownStyleData: DropdownStyleData(
                      maxHeight: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 255, 252, 244),
                      ),
                      openInterval:
                          const Interval(0, 1, curve: Curves.bounceInOut),
                      elevation: 1),
                  menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.all(5), height: 60),
                  underline: Container(),
                  alignment: Alignment.center,
                  items: AppLists.ebsalmodyaSections.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      alignment: Alignment.center,
                      child: Text(e),
                    );
                  }).toList(),
                  value: sefrSelectedVal,
                  style: const TextStyle(
                    fontSize: 18.5,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.clip,
                  ),
                  onChanged: (value) {
                    setState(() {
                      sefrSelectedVal = value;
                      mapIndex = AppLists.ebsalmodyaSections.indexOf(value!);
                      MyConstVar.selectedChapter = mapIndex;
                      MyConstVar.es7a7Counter = 1;
                    });
                    initState();
                  },
                ),
              ),
              ///////////////////////////////  es7a7 dropdown button
              DropdownButton2<int>(
                alignment: Alignment.topRight,
                underline: Container(),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 350,
                  elevation: 1,
                  scrollPadding: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  openInterval: const Interval(0, 1, curve: Curves.bounceInOut),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 255, 252, 244),
                  ),
                ),
                style: const TextStyle(
                  fontSize: 16.5,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                items:
                    List.generate(es7a7Length, (index) => index, growable: true)
                        .map((e) {
                  return DropdownMenuItem<int>(
                      alignment: Alignment.center,
                      value: List.generate(es7a7Length, (index) => index,
                          growable: true)[e],
                      child: Text(AppMaps.ebsalmodya["ebsalmodya"][AppLists
                              .ebsalmodyaSections[MyConstVar.selectedChapter]]
                          [e + 1]["title"]));
                }).toList(),
                value: MyConstVar.es7a7Counter - 1,
                onChanged: (value) {
                  setState(() {
                    MyConstVar.es7a7Counter = value! + 1;
                    // es7a7selectedValue = MyConstVar.es7a7Counter ;
                  });
                },
              ),
              /////////////////////   reading panel
              Expanded(
                child: Swipe(
                  onSwipeRight: () => setState(() {
                    if (MyConstVar.es7a7Counter == 1) {
                    } else {
                      MyConstVar.es7a7Counter--;
                      es7a7selectedValue = MyConstVar.es7a7Counter;
                    }
                    scrollController.jumpTo(0.0);
                  }),
                  onSwipeLeft: () => setState(() {
                    if (MyConstVar.es7a7Counter >= 1 &&
                        MyConstVar.es7a7Counter < es7a7Length) {
                      MyConstVar.es7a7Counter++;
                      es7a7selectedValue = MyConstVar.es7a7Counter;
                    }
                    scrollController.jumpTo(0.0);
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
                      child: Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                           crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150,
                              child: AutoSizeText(
                                AppMaps.ebsalmodya["ebsalmodya"][
                                        AppLists.ebsalmodyaSections[
                                            MyConstVar.selectedChapter]]
                                    [MyConstVar.es7a7Counter]["arabicContent"],
                                textDirection: TextDirection.rtl,
                                overflow: TextOverflow.clip,
                                style:  TextStyle(
                                  fontSize: Settings.appFontSize,
                                  fontWeight: Settings.appFontWeight,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: AutoSizeText(
                                AppMaps.ebsalmodya["ebsalmodya"][
                                        AppLists.ebsalmodyaSections[
                                            MyConstVar.selectedChapter]]
                                    [MyConstVar.es7a7Counter]["CopticContent"],
                                textDirection: TextDirection.rtl,
                                overflow: TextOverflow.clip,
                                style:  TextStyle(
                                  fontSize: Settings.appFontSize,
                                  fontWeight: Settings.appFontWeight,
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
