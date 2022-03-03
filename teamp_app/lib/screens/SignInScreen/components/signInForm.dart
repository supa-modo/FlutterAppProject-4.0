import 'package:flutter/material.dart';

import '../../../components/defaultButton.dart';
import '../../../components/svgIcons.dart';
import '../../../constants.dart';
import '../../../sizeConfig.dart';
import '../../forgotPasswordSreen/forgotPassword.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final formKey = GlobalKey<FormState>();

  bool rememberMe = false;

  final List<String> errors = []; 
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(children: [
        // SizedBox(height: getScreenHeight(60)),
        //email entry field. method exported
        emailFormField(),
        SizedBox(height: getScreenHeight(25),),
        //password entry field. method extracted
        passwordFormField(),
        SizedBox(height: getScreenHeight(40),),
        Row(
          children: [
            Checkbox(
              activeColor: Color.fromARGB(255, 34, 141, 52),
              value: rememberMe, 
              onChanged: (value){setState(() {
              rememberMe = value!;
            });}
            ),
            Text("Remember Me"),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.popAndPushNamed(context, ForgotPasswordScreen.routeName),
              child: Text("Forgot Password", style: TextStyle(decoration: TextDecoration.underline, color: Color.fromARGB(255, 106, 150, 224)))),
          ],
        ),
        SizedBox(height: getScreenHeight(10),),
        //errorsForm(errors: errors),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(55)),
          child: DefaultButton(
            text: "Login",
            pressed: (){
              if (formKey.currentState!.validate()){
                formKey.currentState!.save();
                //Navigator.pushNamed(context, routeName)
              }
            },
            ),
        ),
      //   TextButton(
      //   style: ButtonStyle(
      //     backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 34, 141, 52)),
      //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
      //     ),
      //   ),
      //   onPressed: (){},
      // child: Text("Login", style: TextStyle(fontSize: getScreenWidth(17), color: Colors.white,)),
      // ),
      ]),
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

