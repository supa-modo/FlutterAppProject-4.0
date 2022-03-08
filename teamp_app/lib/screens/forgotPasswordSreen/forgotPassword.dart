import 'package:flutter/material.dart';
import 'package:teamp_app/screens/forgotPasswordSreen/components/body.dart';
import 'package:teamp_app/sizeConfig.dart';

import '../../constants.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgotPassword";
  const ForgotPasswordScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("Forgot Password", textAlign: TextAlign.center, style: TextStyle(fontSize: getScreenWidth(19)),)
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