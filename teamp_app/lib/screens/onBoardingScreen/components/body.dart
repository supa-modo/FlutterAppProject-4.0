import 'package:flutter/material.dart';
import 'package:teamp_app/constants.dart';
import 'package:teamp_app/screens/SignInScreen/signInScreen.dart';
import 'package:teamp_app/screens/onBoardingScreen/components/onBoardContent.dart';
import 'package:teamp_app/sizeConfig.dart';

import '../../../components/defaultButton.dart';
import '../../../components/sliderDots.dart';
import '../components/onBoardContent.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      //--------------------------------------------------------
      // child: Center(
      //       child: Container(
      //         constraints: BoxConstraints.expand(),
      //         decoration: BoxDecoration(
      //         image: DecorationImage(
      //           image: NetworkImage("https://i.pinimg.com/736x/79/3e/16/793e166a6c55ad21e6fb83be710d98d0--fruit-shop-farmers-market.jpg"),
      //         fit: BoxFit.cover)
      //         ),
      //         child: Column(
      //     children: <Widget>[
      //     Expanded(
      //       flex: 3,
      //       child: PageView.builder(
      //         itemBuilder: (context, index) 
      //         => OnboardContent(
      //           text: "Welcome to myApp...",
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       flex: 2, 
      //       child: Padding(
      //         padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
      //         child: Column(
      //         children: <Widget>[
      //           Spacer(flex: 2),
      //           sliderDots(),
      //           Spacer(flex: 1),
      //           DefaultButton(
      //             text: "Continue",
      //             pressed: (){
      //               Navigator.pushNamed(context, SignInScreen.routeName);
      //             },
      //           ),
      //           Spacer(),
      //         ],
      //     ),
      //       )
      //     )
      //   ]
      //   ),
      //          )
      //         ),
      //-------------------------------------------------------
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
          Expanded(
            flex: 3,
            child: PageView.builder(
              itemBuilder: (context, index) 
              => OnboardContent(
                text: "Welcome to myApp...",
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
                  pressed: (){
                    Navigator.pushNamed(context, SignInScreen.routeName);
                  },
                ),
                Spacer(),
              ],
          ),
            )
          )
        ]
        ),
      ),
    );
  }
}

