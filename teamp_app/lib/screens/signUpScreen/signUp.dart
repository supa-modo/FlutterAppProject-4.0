import 'package:flutter/material.dart';
import 'package:teamp_app/screens/signUpScreen/components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/signUp";
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In", textAlign: TextAlign.center,),
      ),
      body: Body(),
    );
  }
}