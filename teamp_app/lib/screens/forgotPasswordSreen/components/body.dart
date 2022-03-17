import 'package:flutter/material.dart';
import 'package:teamp_app/components/defaultButton.dart';
import 'package:teamp_app/screens/SignInScreen/components/body.dart';
import 'package:teamp_app/sizeConfig.dart';

import '../../../components/svgIcons.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  //TODO
  //---------------ADD KEY FORM ERROR PARAMETERS 29.40---------------------------------
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(25)),
          child: Column(
            children: [
      
            SizedBox(height: SizeConfig.screenHeight! * 0.1),
      
              Text(
                "Forgot Password?", 
                style: TextStyle(fontSize: getScreenWidth(29), color:  Colors.black, fontWeight: FontWeight.bold),
                ),
              Text("Please enter your account email address to \nreceive a password reset code", textAlign: TextAlign.center,),
              
              SizedBox(height: SizeConfig.screenHeight! * 0.11),
      
              ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  final formKey = GlobalKey<FormState>();

  ForgotPasswordForm({ Key? key }) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  // TODO
  //--------------------------------Review the various form errors---------------------------------
  //final List<String> errors = []; 
  late String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      // TODO
      //NEEDS MORE RESEARCH
      //key: formKey,
      child: Column(
        children: [
          TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => email = newValue!,
        onChanged: (value){
          // TODO
          //------------------Review the various form field errors(17.54)---------------------------
          // if (value.isEmpty && !errors.contains(nullEmailError)){
          //   setState(() {
          //     errors.add(nullEmailError);
          //   });
          // }
          // return null;
        },
        decoration: const InputDecoration(
          labelStyle: TextStyle(fontSize: 16),
          hintStyle: TextStyle(fontSize: 14),
          labelText: "Email",
          hintText: "Enter Your Email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg",)
            ),
          ),
        SizedBox(height: SizeConfig.screenHeight! * 0.1),
      
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(70)),
          child: DefaultButton(
            text: "Continue",
            pressed: (){
              // if (formKey.currentState.validate()){
              //   // TODO
              //   //TO ADD WHAT HAPPENS WHEN THE CONTINUE BUTTONS IS TAPPED. POSTPONED FOR NOW
              // }
            },
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight! * 0.1),

        NoAccountTxt(),
        ],
      ),
    );
  }
}