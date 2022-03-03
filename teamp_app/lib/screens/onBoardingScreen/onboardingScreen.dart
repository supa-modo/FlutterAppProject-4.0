import 'package:flutter/material.dart';
import 'package:teamp_app/screens/onBoardingScreen/components/body.dart';
import 'package:teamp_app/sizeConfig.dart';

class OnboardingScreen extends StatelessWidget {
  static String routeName = "/onBoarding";
  const OnboardingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}