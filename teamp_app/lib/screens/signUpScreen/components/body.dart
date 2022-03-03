import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:teamp_app/components/defaultButton.dart';
import 'package:teamp_app/constants.dart';
import 'package:teamp_app/sizeConfig.dart';

import '../../../components/socMediaIcons.dart';
import '../../../components/svgIcons.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight! * 0.07),
            Text("Register Account",
            style: headingStyle,
            ),
            Text("Fill in your details to continue", textAlign: TextAlign.center,),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({ Key? key }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String confirmPassword;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: getScreenHeight(40),),
          emailFormField(),
          SizedBox(height: getScreenHeight(18),),
          passwordFormField(),
          SizedBox(height: getScreenHeight(18),),
          TextFormField(
      obscureText: true,
      // TODO 
      //---------------6.40 TO ADD MORE PROPERTIES AND CONDITIONS/ERROR MESSAGES --ONSAVED...--------------------
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 16),
        hintStyle: TextStyle(fontSize: 14),
        labelText: "Confirm Password",
        hintText: "Confirm Your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg",)
              ),
            ),

            SizedBox(height: getScreenHeight(18),),

          TextFormField(
            keyboardType: TextInputType.phone,
      obscureText: false,
      // TODO 
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 16),
        hintStyle: TextStyle(fontSize: 14),
        labelText: "Phone Number",
        hintText: "Enter Your Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Call.svg"),
            ),
          ),

          SizedBox(height: getScreenHeight(20),),


          Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenWidth(60)),
            child: DefaultButton(
              text: "Register",
              pressed: (){},
            ),
          ),

          SizedBox(height: getScreenHeight(20),),  

          Text("or \nsignup with your social media account", textAlign: TextAlign.center), 
          SizedBox(height: getScreenHeight(20),),
       
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

        ],
      ),
    );
  }

  TextFormField passwordFormField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 16),
        hintStyle: TextStyle(fontSize: 14),
        labelText: "Password",
        hintText: "Enter Your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg",)
      ),
    );
  }

  TextFormField emailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value){
        // TODO
        //------------------Review the various form field errors(17.54)---------------------------
        if (value.isEmpty && !errors.contains(nullEmailError)){
          setState(() {
            errors.add(nullEmailError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 16),
        hintStyle: TextStyle(fontSize: 14),
        labelText: "Email",
        hintText: "Enter Your Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg",)
      ),
    );
  }
}