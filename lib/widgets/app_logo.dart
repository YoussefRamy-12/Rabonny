
import 'package:flutter/material.dart';

class AppLogo {

   static Widget logo = const SizedBox(
      height: 180,
      child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.all(Radius.circular(90)),
          child: Image(
            image: AssetImage("assets/images/appLogo.png"),
          )));

  
}