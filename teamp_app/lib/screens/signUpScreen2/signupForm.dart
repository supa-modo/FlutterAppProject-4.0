import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teamp_app/net/flutterfire.dart';

import '../../components/defaultButton.dart';
import '../../components/socMediaIcons.dart';
import '../../components/svgIcons.dart';
import '../../constants.dart';
import '../../sizeConfig.dart';
import '../homeScreen/homeScreen.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({Key? key}) : super(key: key);


  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  TextEditingController _confirmPasswordField = TextEditingController();

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
          SizedBox(
            height: getScreenHeight(40),
          ),
          emailFormField(),
          SizedBox(
            height: getScreenHeight(25),
          ),
          passwordFormField(),
          SizedBox(
            height: getScreenHeight(25),
          ),
          TextFormField(
            controller: _confirmPasswordField,
            obscureText: true,
            textInputAction: TextInputAction.done,
            // TODO
            //---------------6.40 TO ADD MORE PROPERTIES AND CONDITIONS/ERROR MESSAGES --ONSAVED...--------------------
            decoration: const InputDecoration(
                labelStyle: TextStyle(fontSize: 16),
                hintStyle: TextStyle(fontSize: 14),
                labelText: "Confirm Password",
                hintText: "Confirm Your Password",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSuffixIcon(
                  svgIcon: "assets/icons/Lock.svg",
                )),
          ),
          SizedBox(
            height: getScreenHeight(40),
          ),
        const Text("**By pressing the Register button you agree to our terms and conditions**", style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic), textAlign: TextAlign.center,),
          SizedBox(
            height: getScreenHeight(20),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenWidth(60)),
            child: DefaultButton(
              text: "Register",
              pressed: () async{
                bool shouldNavigate = await signUp(_emailField.text, _passwordField.text, _confirmPasswordField.text);
                if(shouldNavigate){
                  Navigator.pushNamed(context, HomeScreen.routeName);
                }
                //FirebaseAuth.instance.createUserWithEmailAndPassword(email: , password: password)
                // TODO
                //--------------------------pending conditions for moving to next screen/ backend validation and sending to database etc-----------------------------------------------------------------------------
                
              },
            ),
          ),
          SizedBox(
            height: getScreenHeight(20),
          ),
          const Text("or \nsignup with your social media account",
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

  TextFormField passwordFormField() {
    return TextFormField(
      controller: _passwordField,
      onSaved: (values){},
      textInputAction: TextInputAction.next,
      obscureText: true,
      decoration: const InputDecoration(
          labelStyle: TextStyle(fontSize: 16),
          hintStyle: TextStyle(fontSize: 14),
          labelText: "Password",
          hintText: "Enter Your Password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: "assets/icons/Lock.svg",
          )),
    );
  }

  TextFormField emailFormField() {
    return TextFormField(
      controller: _emailField,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onSaved: (value){},
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
      decoration: const InputDecoration(
          labelStyle: TextStyle(fontSize: 16),
          hintStyle: TextStyle(fontSize: 14),
          labelText: "Email",
          hintText: "Enter Your Email address",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: "assets/icons/Mail.svg",
          )),
    );
  }
}