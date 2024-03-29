import 'package:flutter/material.dart';
import 'package:teamp_app/constants.dart';
import 'package:teamp_app/sizeConfig.dart';

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
              SizedBox(height: SizeConfig.screenHeight! * 0.0005),
              Text(
                "Register Account",
                style: headingStyle,
              ),
              const Text(
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
