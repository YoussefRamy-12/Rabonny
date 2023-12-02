import 'package:flutter/material.dart';
import 'package:rabonny/constants/settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 230, 196, 1),
      body: SafeArea(

        child: Padding(

          padding: const EdgeInsets.all(8.0),
          child: Column(
        
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: Container(
                    alignment: Alignment.center,
                    // width: 100,
                    // height: 50,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        // border: Border.all(width: 1, color: Colors.white70),
                        color: Color.fromARGB(255, 219, 213, 190)),
                    child: Text(
                      "Book Font Size",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Settings.appFontSize,
                        fontWeight: Settings.appFontWeight,
                      ),
                    )),
                onTap: () {
                  // Show a dialog with 3 options
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        elevation: 1,
                        insetPadding: const EdgeInsets.all(24),
                        // contentPadding: EdgeInsets.all(8),
                        // alignment: Alignment.center,
        
                        title: const Text("Choose Font Size"),
                        children: [
                          SimpleDialogOption(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: const Text("Large",
                                  style: TextStyle(fontSize: 40)),
                            ),
                            onPressed: () {
                              setState(() {
                                Settings.appFontSize = 40;
                                Navigator.pop(context);
                              });
                            },
                          ),
                          SimpleDialogOption(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: const Text("Medium",
                                  style: TextStyle(fontSize: 18)),
                            ),
                            onPressed: () {
                              setState(() {
                                Settings.appFontSize = 18;
                                Navigator.pop(context);
                              });
                            },
                          ),
                          SimpleDialogOption(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: const Text("Small",
                                  style: TextStyle(fontSize: 15)),
                            ),
                            onPressed: () {
                              setState(() {
                                Settings.appFontSize = 15;
                                Navigator.pop(context);
                              });
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              InkWell(
                child: Container(
                    alignment: Alignment.center,
                    // width: 100,
                    // height: 50,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        // border: Border.all(width: 1, color: Colors.white70),
                        color: Color.fromARGB(255, 219, 213, 190)),
                    child: Text(
                      "Book Font Weight",
                      style: TextStyle(
                          fontSize: Settings.appFontSize,
                          fontWeight: Settings.appFontWeight),
                    )),
                onTap: () {
                  // Show a dialog with 3 options
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        elevation: 1,
                        insetPadding: const EdgeInsets.all(24),
                        // contentPadding: EdgeInsets.all(8),
                        // alignment: Alignment.center,
        
                        title: const Text("Choose Font Size"),
                        children: [
                          SimpleDialogOption(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: const Text("Bold",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            onPressed: () {
                              setState(() {
                                Settings.appFontWeight = FontWeight.bold;
                                Navigator.pop(context);
                              });
                            },
                          ),
                          SimpleDialogOption(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: const Text("Normal",
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                            ),
                            onPressed: () {
                              setState(() {
                                Settings.appFontWeight = FontWeight.normal;
                                Navigator.pop(context);
                              });
                            },
                          ),
                          SimpleDialogOption(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: const Text("Thin",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w100)),
                            ),
                            onPressed: () {
                              setState(() {
                                Settings.appFontWeight = FontWeight.w100;
                                Navigator.pop(context);
                              });
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              InkWell(
                child: Container(
                    alignment: Alignment.center,
                    // width: 100,
                    // height: 50,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        // border: Border.all(width: 1, color: Colors.white70),
                        color: Color.fromARGB(255, 219, 213, 190)),
                    child: Text(
                      "About Us",
                      style: TextStyle(
                          fontSize: Settings.appFontSize,
                          fontWeight: Settings.appFontWeight),
                    )),
                onTap: () {
                  // Show a dialog with 3 options
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        elevation: 1,
                        insetPadding: const EdgeInsets.all(24),
                        // contentPadding: EdgeInsets.all(8),
                        // alignment: Alignment.center,
        
                        title: const Text("App info"),
                        children: [
                          SimpleDialogOption(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: const Text(
                                  '''This is Beta version of Rabonny
                              
                               تم التصميم و التنفيذ بواسطة فريق الابتكارات الالكترونية بكنيسة السيدة العذراء مريم بعياد بك 2023''',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
              ),
              InkWell(
                child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 50,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        // border: Border.all(width: 1, color: Colors.white70),
                        color: Color.fromARGB(255, 219, 213, 190)),
                    child: Text(
                      "Update",
                      style: TextStyle(
                          fontSize: Settings.appFontSize,
                          fontWeight: Settings.appFontWeight),
                    )),
                onTap: () {
                  // Show a dialog with 3 options
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        elevation: 1,
                        insetPadding: const EdgeInsets.all(24),
                        // contentPadding: EdgeInsets.all(8),
                        // alignment: Alignment.center,
        
                        title: const Text("App Version"),
                        children: [
                          SimpleDialogOption(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: const Text(
                                  '''This is latest version of app''',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
