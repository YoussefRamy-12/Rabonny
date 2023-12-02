import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:rabonny/constants/app_lists.dart';
import 'package:rabonny/constants/app_maps.dart';
import 'package:rabonny/constants/constants_vars.dart';
import 'package:rabonny/constants/settings.dart';
import 'package:swipe/swipe.dart';

class NewTestamentReadingPage extends StatefulWidget {
  const NewTestamentReadingPage({super.key});

  @override
  State<NewTestamentReadingPage> createState() =>
      _NewTestamentReadingPageState();
}

class _NewTestamentReadingPageState extends State<NewTestamentReadingPage> {
  String? sefrSelectedVal =
      AppLists.namesOfChaptersNewTestament[MyConstVar.selectedChapter];

  // // String currentVerses = AppMaps.oldTestament["oldTestament"][
  //                             AppLists.namesOfChaptersOldTestament[
  //                                 MyConstVar.selectedChapter]]
  //                         [MyConstVar.es7a7Counter]["verses"];

  // // String currentEs7a7Number =
  //                           AppMaps.oldTestament["oldTestament"][
  //                                   AppLists.namesOfChaptersOldTestament[
  //                                       MyConstVar.selectedChapter]]
  //                               [MyConstVar.es7a7Counter]["id"];

  // // String totalEs7a7NumberString =
  //                           AppMaps.oldTestament["oldTestament"][AppLists
  //                                   .namesOfChaptersOldTestament[
  //                               MyConstVar.selectedChapter]][0]["totalString"];
  int mapIndex = 0;

  int es7a7selectedValue = MyConstVar.es7a7Counter;

  // int es7a7Length =

  List<int> sefrSelectedNum = List.generate(
      AppMaps.newTestament["newTestament"]
              [AppLists.namesOfChaptersNewTestament[MyConstVar.selectedChapter]]
          [0]["total"],
      (index) => index,
      growable: true);

  @override
  void initState() {
    super.initState();
    setState(() {
      MyConstVar.es7a7Counter = 1;
      // sefrSelectedVal=;
      es7a7selectedValue = MyConstVar.es7a7Counter;
      sefrSelectedNum = List.generate(
          AppMaps.newTestament["newTestament"]
              [AppLists.namesOfChaptersNewTestament[mapIndex]][0]["total"],
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
        title: const Text("الكتاب المقدس",
            style: TextStyle(color: Colors.black, fontSize: 25)),
        backgroundColor: Colors.white,
        elevation: 3.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
              ///////////////////////////// sefr dropdown button
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
                  items: AppLists.namesOfChaptersNewTestament.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      alignment: Alignment.center,
                      child: Text(e),
                    );
                  }).toList(),
                  value: sefrSelectedVal,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (value) {
                    setState(() {
                      sefrSelectedVal = value;
                      mapIndex =
                          AppLists.namesOfChaptersNewTestament.indexOf(value!);
                      MyConstVar.selectedChapter = mapIndex;
                      MyConstVar.es7a7Counter = 1;
                    });
                    initState();
                  },
                ),
              ),
              ////////////////////////// es7a7 dropdown button
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
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                items: List.generate(
                        AppMaps.newTestament["newTestament"][
                            AppLists.namesOfChaptersNewTestament[
                                MyConstVar.selectedChapter]][0]["total"],
                        (index) => index,
                        growable: true)
                    .map((e) {
                  return DropdownMenuItem<int>(
                      alignment: Alignment.center,
                      value: List.generate(
                          AppMaps.newTestament["newTestament"][
                              AppLists.namesOfChaptersNewTestament[
                                  MyConstVar.selectedChapter]][0]["total"],
                          (index) => index,
                          growable: true)[e],
                      child: Text(AppMaps.newTestament["newTestament"]
                              [AppLists.namesOfChaptersNewTestament[MyConstVar.selectedChapter]]
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
              //////////////////////////// reading panel
              Expanded(
                child: Swipe(
                  onSwipeRight:  () => setState(() {
                              if (MyConstVar.es7a7Counter == 1) {
                              } else {
                                MyConstVar.es7a7Counter--;
                                es7a7selectedValue = MyConstVar.es7a7Counter;
                              }
                              scrollController.jumpTo(0.0);
                            }),
                  onSwipeLeft:() => setState(() {
                              if (MyConstVar.es7a7Counter >= 1 &&
                                  MyConstVar.es7a7Counter <
                                      AppMaps
                                          .newTestament["newTestament"][AppLists
                                              .namesOfChaptersNewTestament[
                                          MyConstVar
                                              .selectedChapter]][0]["total"]) {
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
                      child: AutoSizeText(
                        AppMaps.newTestament["newTestament"][
                                AppLists.namesOfChaptersNewTestament[
                                    MyConstVar.selectedChapter]]
                            [MyConstVar.es7a7Counter]["verses"],
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.clip,
                        style:  TextStyle(
                          fontSize: Settings.appFontSize,
                          fontWeight: Settings.appFontWeight,
                        ),
                        // maxLines: 12,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.all(Radius.circular(60))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 180,
                      height: 48,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 35,
                            ),
                            onTap: () => setState(() {
                              if (MyConstVar.es7a7Counter == 1) {
                              } else {
                                MyConstVar.es7a7Counter--;
                                es7a7selectedValue = MyConstVar.es7a7Counter;
                              }
                              scrollController.jumpTo(0.0);
                            }),
                          ),
                          Text(
                            AppMaps.newTestament["newTestament"][
                                    AppLists.namesOfChaptersNewTestament[
                                        MyConstVar.selectedChapter]]
                                [MyConstVar.es7a7Counter]["id"],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                          const Text(
                            "/",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          Text(
                            AppMaps.newTestament["newTestament"][AppLists
                                    .namesOfChaptersNewTestament[
                                MyConstVar.selectedChapter]][0]["totalString"],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                          InkWell(
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 35,
                            ),
                            onTap: () => setState(() {
                              if (MyConstVar.es7a7Counter >= 1 &&
                                  MyConstVar.es7a7Counter <
                                      AppMaps
                                          .newTestament["newTestament"][AppLists
                                              .namesOfChaptersNewTestament[
                                          MyConstVar
                                              .selectedChapter]][0]["total"]) {
                                MyConstVar.es7a7Counter++;
                                es7a7selectedValue = MyConstVar.es7a7Counter;
                              }
                              scrollController.jumpTo(0.0);
                            }),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      child:const Text("العهد القديم",style: TextStyle(fontSize: 22)),
                      
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "oldTestament");
                        MyConstVar.selectedChapter = 0;
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
