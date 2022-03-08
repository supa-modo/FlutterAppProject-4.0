import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teamp_app/constants.dart';
import 'package:teamp_app/routes.dart';
import 'package:teamp_app/screens/SignInScreen/signInScreen.dart';
import 'package:teamp_app/screens/onBoardingScreen/onboardingScreen.dart';
import 'package:teamp_app/screens/profile/profileScreen.dart';
import 'package:teamp_app/theme.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: OnboardingScreen(),
      // home: SignInScreen(),
      initialRoute: OnboardingScreen.routeName,
      // initialRoute: ProfileScreen.routeName,
      // initialRoute: SignInScreen.routeName,
      routes: routes,
    );
  }
}

