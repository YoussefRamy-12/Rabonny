import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:rabonny/constants/app_lists.dart';
import 'package:rabonny/constants/app_maps.dart';
import 'package:rabonny/constants/constants_vars.dart';
import 'package:rabonny/constants/settings.dart';
import 'package:rabonny/widgets/app_logo.dart';
import 'package:swipe/swipe.dart';

class AgbyaReadingPage extends StatefulWidget {
  const AgbyaReadingPage({super.key});

  @override
  State<AgbyaReadingPage> createState() => _AgbyaReadingPageState();
}

class _AgbyaReadingPageState extends State<AgbyaReadingPage> {
  String? salaSelectedVal = AppLists.namesOfSalaot[MyConstVar.selectedChapter];

  String textOfSala = AppMaps.agbya["agbya"]
          [AppLists.namesOfSalaot[MyConstVar.selectedChapter]]
      [MyConstVar.es7a7Counter]["text"];

  int mapIndex = 0;
  int salaselectedValue = MyConstVar.es7a7Counter;

  int salaLenght = AppMaps.agbya["agbya"]
      [AppLists.namesOfSalaot[MyConstVar.selectedChapter]][0]["total"];

  List<int> salaSelectedNum = List.generate(
      AppMaps.agbya["agbya"][AppLists.namesOfSalaot[MyConstVar.selectedChapter]]
          [0]["total"],
      (index) => index,
      growable: true);

  @override
  void initState() {
    super.initState();
    setState(() {
      MyConstVar.es7a7Counter = 1;
      // sefrSelectedVal=;
      salaselectedValue = MyConstVar.es7a7Counter;
      salaSelectedNum = List.generate(
          AppMaps.agbya["agbya"][AppLists.namesOfSalaot[mapIndex]][0]["total"],
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
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        title: const Text("الأجبية",
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
              ////////////////////// sala name
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
                  items: AppLists.namesOfSalaot.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      alignment: Alignment.center,
                      child: Text(e),
                    );
                  }).toList(),
                  value: salaSelectedVal,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (value) {
                    setState(() {
                      salaSelectedVal = value;
                      mapIndex = AppLists.namesOfSalaot.indexOf(value!);
                      MyConstVar.selectedChapter = mapIndex;
                      MyConstVar.es7a7Counter = 1;
                    });
                    initState();
                  },
                ),
              ),
              ///////////////////// agza2 el sala
              DropdownButton2<int>(
                alignment: Alignment.topRight,
                underline: Container(),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 350,
                  elevation: 1,
                  scrollPadding: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  // width: 100,
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
                items:
                    List.generate(salaLenght, (index) => index, growable: true)
                        .map((e) {
                  return DropdownMenuItem<int>(
                      alignment: Alignment.center,
                      value: List.generate(salaLenght, (index) => index,
                          growable: true)[e],
                      child: Text(AppMaps.agbya["agbya"][AppLists
                              .namesOfSalaot[MyConstVar.selectedChapter]][e + 1]
                          ["title"]));
                }).toList(),
                value: MyConstVar.es7a7Counter - 1,
                onChanged: (value) {
                  setState(() {
                    MyConstVar.es7a7Counter = value! + 1;
                    // es7a7selectedValue = MyConstVar.es7a7Counter ;
                  });
                },
              ),
              /////////////////// sala reading panel
              Expanded(
                child: Swipe(
                  onSwipeRight: () => setState(() {
                    if (MyConstVar.es7a7Counter == 1) {
                    } else {
                      MyConstVar.es7a7Counter--;
                      salaselectedValue = MyConstVar.es7a7Counter;
                    }
                    scrollController.jumpTo(0.0);
                  }),
                 onSwipeLeft : () => setState(() {
                    if (MyConstVar.es7a7Counter >= 1 &&
                        MyConstVar.es7a7Counter < salaLenght) {
                      MyConstVar.es7a7Counter++;
                      salaselectedValue = MyConstVar.es7a7Counter;
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
                      child: Text(
                        AppMaps.agbya["agbya"][AppLists
                                .namesOfSalaot[MyConstVar.selectedChapter]]
                            [MyConstVar.es7a7Counter]["text"],
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
                    InkWell(
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                        size: 35,
                      ),
                      onTap: () => setState(() {
                        if (MyConstVar.es7a7Counter == 1) {
                        } else {
                          MyConstVar.es7a7Counter--;
                          salaselectedValue = MyConstVar.es7a7Counter;
                        }
                        scrollController.jumpTo(0.0);
                      }),
                    ),
                    InkWell(
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 35,
                      ),
                      onTap: () => setState(() {
                        if (MyConstVar.es7a7Counter >= 1 &&
                            MyConstVar.es7a7Counter < salaLenght) {
                          MyConstVar.es7a7Counter++;
                          salaselectedValue = MyConstVar.es7a7Counter;
                        }
                        scrollController.jumpTo(0.0);
                      }),
                    ),
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
