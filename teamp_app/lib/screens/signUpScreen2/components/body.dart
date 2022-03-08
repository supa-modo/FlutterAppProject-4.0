import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:teamp_app/components/defaultButton.dart';
import 'package:teamp_app/constants.dart';
import 'package:teamp_app/screens/onBoardingScreen/onboardingScreen.dart';
import 'package:teamp_app/sizeConfig.dart';

import '../../../components/socMediaIcons.dart';
import '../../../components/svgIcons.dart';
import '../signupForm.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight! * 0.07),
              Text(
                "Register Account",
                style: headingStyle,
              ),
              Text(
                "Fill in your details to continue",
                textAlign: TextAlign.center,
              ),
              SignUpForm(),
              // TODO
              // -----------to add the backend section for the sign up form------------
            ],
          ),
        ),
      ),
    );
  }
}


