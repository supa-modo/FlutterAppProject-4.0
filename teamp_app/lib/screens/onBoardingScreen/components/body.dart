import 'package:flutter/material.dart';
import 'package:teamp_app/screens/SignInScreen/signInScreen.dart';
import 'package:teamp_app/screens/onBoardingScreen/components/onBoardContent.dart';
import 'package:teamp_app/sizeConfig.dart';

import '../../../components/defaultButton.dart';
import '../../../components/sliderDots.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(children: <Widget>[
          Expanded(
            flex: 3,
            child: PageView.builder(
              itemBuilder: (context, index) => const OnboardContent(
                text: "Welcome to eSoko App...",
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(flex: 2),
                    sliderDots(),
                    Spacer(flex: 1),
                    DefaultButton(
                      text: "Continue",
                      pressed: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
