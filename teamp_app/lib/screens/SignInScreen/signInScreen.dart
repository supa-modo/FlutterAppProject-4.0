import 'package:flutter/material.dart';
import 'package:teamp_app/screens/SignInScreen/components/body.dart';


class SignInScreen extends StatelessWidget {
  static String routeName = "/signIn";
  const SignInScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        centerTitle: true,
      ),
      body: Body(),

    );
  }
}