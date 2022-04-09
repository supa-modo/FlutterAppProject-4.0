import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:teamp_app/constants.dart';
import 'package:teamp_app/notifier/notifier.dart';
import 'package:teamp_app/routes.dart';
import 'package:teamp_app/screens/SignInScreen/signInScreen.dart';
import 'package:teamp_app/screens/onBoardingScreen/onboardingScreen.dart';
import 'package:teamp_app/screens/productDetailsScreen/productDetailsScreen.dart';
import 'package:teamp_app/screens/profileScreen/profileScreen.dart';
import 'package:teamp_app/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(
      create: (BuildContext context) => ProductsNotifier(),
        )
      ],
      child: MyApp(),
    ),
  ); 
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

