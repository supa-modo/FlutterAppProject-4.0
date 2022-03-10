import 'package:flutter/material.dart';

import '../../../components/defaultButton.dart';
import '../../../components/socMediaIcons.dart';
import '../../../components/svgIcons.dart';
import '../../../constants.dart';
import '../../../sizeConfig.dart';
import '../../signUpScreen2/signUp.dart';

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
              SizedBox(height: SizeConfig.screenHeight! * 0.004),
              Text(
                "Register Account",
                style: headingStyle,
              ),
              Text(
                "Fill in your details to continue",
                textAlign: TextAlign.center,
              ),
              SignUpForm1(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpForm1 extends StatefulWidget {
  const SignUpForm1({Key? key}) : super(key: key);

  @override
  State<SignUpForm1> createState() => _SignUpForm1State();
}

class _SignUpForm1State extends State<SignUpForm1> {
  final formKey = GlobalKey<FormState>();
  late String firstName;
  late String otherNames;
  late String phoneNumber;
  late String address;
  late String confirmPassword;
  bool agreeToTerms = false;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: getScreenHeight(40),
          ),
          fNameFormField(),
          SizedBox(
            height: getScreenHeight(18),
          ),
          lNameFormField(),
          SizedBox(
            height: getScreenHeight(18),
          ),
          phoneFormField(),
          SizedBox(
            height: getScreenHeight(18),
          ),
          TextFormField(
            obscureText: true,
            textInputAction: TextInputAction.next,
            // TODO
            //---------------6.40 TO ADD MORE PROPERTIES AND CONDITIONS/ERROR MESSAGES --ONSAVED...--------------------
            decoration: InputDecoration(
                labelStyle: TextStyle(fontSize: 16),
                hintStyle: TextStyle(fontSize: 14),
                labelText: "Address",
                hintText: "Enter your location Details",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSuffixIcon(
                  svgIcon: "assets/icons/Location point.svg",
                )),
          ),
          SizedBox(
            height: getScreenHeight(20),
          ),

          TextFormField(
            obscureText: true,
            // TODO
            //---------------6.40 TO ADD MORE PROPERTIES AND CONDITIONS/ERROR MESSAGES --ONSAVED...--------------------
            decoration: InputDecoration(
                labelStyle: TextStyle(fontSize: 16),
                hintStyle: TextStyle(fontSize: 14),
                labelText: "**********",
                hintText: "*******************",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSuffixIcon(
                  svgIcon: "assets/icons/Lock.svg",
                )),
          ),

          SizedBox(
            height: getScreenHeight(25),
          ),
          // Row(
          // children: [
          //   Checkbox(
          //     activeColor: Color.fromARGB(255, 34, 141, 52),
          //     value: agreeToTerms,
          //     onChanged: (value){setState(() {
          //     agreeToTerms = value!;
          //   });}
          //   ),
          //   Text("I Agree to the terms and conditions stated on the \nterms and conditions page", style: TextStyle(fontSize: getScreenWidth(12)),),]),

          SizedBox(
            height: getScreenHeight(10),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenWidth(60)),
            child: DefaultButton(
                text: "Continue",
                pressed: () {
                  Navigator.popAndPushNamed(context, SignUpScreen2.routeName);
                }),
          ),
          SizedBox(
            height: getScreenHeight(10),
          ),
          Text("or \nsignup with your social media account",
              textAlign: TextAlign.center),
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
        ],
      ),
    );
  }

  TextFormField phoneFormField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 16),
          hintStyle: TextStyle(fontSize: 14),
          labelText: "Phone Number",
          hintText: "Enter Your Phone Number",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: "assets/icons/Phone.svg",
          )),
    );
  }

  TextFormField fNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        // TODO
        //------------------Review the various form field errors(17.54)---------------------------
        if (value.isEmpty && !errors.contains(nullEmailError)) {
          setState(() {
            errors.add(nullEmailError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 16),
          hintStyle: TextStyle(fontSize: 14),
          labelText: "First Name",
          hintText: "Enter Your First Name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: "assets/icons/User Icon.svg",
          )),
    );
  }

  TextFormField lNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        // TODO
        //------------------Review the various form field errors(17.54)---------------------------
        if (value.isEmpty && !errors.contains(nullEmailError)) {
          setState(() {
            errors.add(nullEmailError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 16),
        hintStyle: TextStyle(fontSize: 14),
        labelText: "Other Names",
        hintText: "Enter Your Other Names",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: Padding(
        //   padding: EdgeInsets.fromLTRB(0, getScreenWidth(17), getScreenWidth(17), getScreenWidth(17),),
        //   child: Icon(
        //     Icons.account_circle,
        //     color: Color.fromARGB(166, 124, 124, 124),
        //   ),
        // ),
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/User Icon.svg",
        ),
      ),
    );
  }
}
