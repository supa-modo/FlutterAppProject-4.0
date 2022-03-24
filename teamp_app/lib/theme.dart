// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teamp_app/constants.dart';

ThemeData theme() {
  return ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Muli",
        appBarTheme: appBarTheme(),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: appTextColor),
          bodyText2: TextStyle(color: appTextColor),
        ),
        inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: appPrimaryColor),
            gapPadding: 4,
          );
  return InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 8),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
          constraints: BoxConstraints(minWidth: 200, maxWidth: 310, minHeight: 30, maxHeight: 48)
  );
}


AppBarTheme appBarTheme() {
  return AppBarTheme(
        color: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          fontSize: 22,
          // fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 70, 70, 70),
          ),
          

      );
}
