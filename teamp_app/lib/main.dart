import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamp_app/notifier/notifier.dart';
import 'package:teamp_app/routes.dart';
import 'package:teamp_app/screens/onBoardingScreen/onboardingScreen.dart';
import 'package:teamp_app/theme.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ProductsNotifier(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
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
      //home: ProductDetails(),
      initialRoute: OnboardingScreen.routeName,
      //initialRoute: ProfileScreen.routeName,
      // initialRoute: SignInScreen.routeName,
      routes: routes,
    );
  }
}
