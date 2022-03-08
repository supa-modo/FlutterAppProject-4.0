import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:teamp_app/screens/signUpscreen1/components/body.dart';

import '../../constants.dart';

class SignUpScreen1 extends StatelessWidget {
  static String routeName = "/signUp1";
  const SignUpScreen1({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up",),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: appPrimaryColor),
        onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Body(),
    );
  }
}