import 'package:flutter/material.dart';
import 'package:teamp_app/sizeConfig.dart';

const appPrimaryColor = Color.fromARGB(255, 34, 141, 52);
const appPrimaryLightColor =Color.fromARGB(255, 213, 248, 213);
const appPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color.fromARGB(255, 62, 255, 142), Color.fromARGB(255, 35, 143, 76)],
);
const appsecondaryColor = Color(0xFF979797);
const appTextColor = Color(0xFF757575);

const appAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getScreenWidth(29), 
  color: Color.fromARGB(255, 34, 141, 52), 
  fontWeight: FontWeight.bold,
  );

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String nullEmailError = "Please Enter your email";
const String invalidEmailEnteredError = "Please Enter Valid Email";
const String nullPasswordError = "Please Enter your password";
const String shortPasswordError = "Password is too short";
const String passwordsMatchError = "Passwords don't match";
const String nullName = "Please Enter your name";
const String nullPhoneNumberError = "Please Enter your phone number";
const String nullAddressError = "Please Enter your address";