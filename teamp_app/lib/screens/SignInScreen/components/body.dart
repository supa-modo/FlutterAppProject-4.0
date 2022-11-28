import 'package:flutter/material.dart';
import 'package:teamp_app/constants.dart';
import 'package:teamp_app/screens/signUpScreen2/signUp.dart';

import '../../../components/socMediaIcons.dart';
import '../../../sizeConfig.dart';
import 'signInForm.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: getScreenHeight(65),),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.06,
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    // color: Colors.black,
                    color: const Color.fromARGB(255, 34, 141, 52),
                    fontSize: getScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: getScreenHeight(10)),
                const Text(
                  "Sign In with your registered email address and password to continue",
                  textAlign: TextAlign.center,
                  //style: TextStyle(color: Color.fromARGB(255, 34, 141, 52)),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.06),
                SignInForm(),
                SizedBox(height: SizeConfig.screenHeight! * 0.04),

                // SizedBox(height: getScreenHeight(40),),

                const Text(
                  "or \nLogin with your social media account",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: getScreenHeight(20),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socMediaIcon(
                      icon: "assets/icons/google-icon.svg",
                      pressed: () {},
                    ),
                    socMediaIcon(
                      icon: "assets/icons/facebook-2.svg",
                      pressed: () {},
                    ),
                    socMediaIcon(
                      icon: "assets/icons/twitter.svg",
                      pressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: getScreenHeight(40),
                ),

                NoAccountTxt()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NoAccountTxt extends StatelessWidget {
  const NoAccountTxt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(fontSize: getScreenWidth(14)),
        ),
        GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen2())),
            child: Text(
              "Sign Up ",
              style: TextStyle(
                  fontSize: getScreenWidth(14), color: appPrimaryColor),
            ))
      ],
    );
  }
}
