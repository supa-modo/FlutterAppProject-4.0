import 'package:flutter/widgets.dart';
import 'package:teamp_app/screens/SignInScreen/signInScreen.dart';
import 'package:teamp_app/screens/forgotPasswordSreen/forgotPassword.dart';
import 'package:teamp_app/screens/homeScreen/homeScreen.dart';
import 'package:teamp_app/screens/onBoardingScreen/onboardingScreen.dart';
import 'package:teamp_app/screens/profileScreen/profileScreen.dart';
import 'package:teamp_app/screens/signUpScreen2/signUp.dart';
import 'package:teamp_app/screens/signUpscreen1/signUpscreen1.dart';

final Map<String, WidgetBuilder> routes = {
  OnboardingScreen.routeName: (context) => OnboardingScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen1.routeName: (context) => SignUpScreen1(),
  SignUpScreen2.routeName: (context) => SignUpScreen2(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};