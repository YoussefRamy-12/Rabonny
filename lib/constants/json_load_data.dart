import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:rabonny/constants/app_maps.dart';


class JsonOperations {
  
   static Future loadData() async {
    // Get the path to the JSON file.
    const String oldTestamentPath = "assets/texts/oldTestament.json";
    const String newTestamentpath = "assets/texts/newTestament.json";
    const String agbya = "assets/texts/agbya.json";
    const String kholagy = "assets/texts/kholagy.json";
    const String ebsalmodya = "assets/texts/ebsalmodya.json";

    // Load the JSON file as a string.
    final String oldTestamentResponce =
        await rootBundle.loadString(oldTestamentPath);
    final String newTestamentResponce =
        await rootBundle.loadString(newTestamentpath);
    final String agbyaResponce =
        await rootBundle.loadString(agbya);
    final String kholagyResponce =
        await rootBundle.loadString(kholagy);
    final String ebsalmodyaResponce =
        await rootBundle.loadString(ebsalmodya);

    // Decode the JSON string into a Dart object.
    AppMaps.oldTestament = json.decode(oldTestamentResponce);
    AppMaps.newTestament = json.decode(newTestamentResponce);
    AppMaps.agbya = json.decode(agbyaResponce);
    AppMaps.kholagy = json.decode(kholagyResponce);
    AppMaps.ebsalmodya = json.decode(ebsalmodyaResponce);
  }
  
}