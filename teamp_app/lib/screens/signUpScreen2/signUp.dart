import 'package:flutter/material.dart';
import 'package:teamp_app/screens/signUpScreen2/components/body.dart';

import '../../constants.dart';

class SignUpScreen2 extends StatelessWidget {
  static String routeName = "/signUp2";
  const SignUpScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign Up",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: appPrimaryColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Body(),
    );
  }
}
