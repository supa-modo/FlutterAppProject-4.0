import 'package:flutter/widgets.dart';
import 'package:teamp_app/screens/SignInScreen/signInScreen.dart';
import 'package:teamp_app/screens/forgotPasswordSreen/forgotPassword.dart';
import 'package:teamp_app/screens/onBoardingScreen/onboardingScreen.dart';
import 'package:teamp_app/screens/signUpScreen/signUp.dart';

final Map<String, WidgetBuilder> routes = {
  OnboardingScreen.routeName: (context) => OnboardingScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
};