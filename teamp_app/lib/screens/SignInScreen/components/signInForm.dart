import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:teamp_app/net/flutterfire.dart';
import 'package:teamp_app/screens/homeScreen/homeScreen.dart';

import '../../../components/defaultButton.dart';
import '../../../components/errors.dart';
import '../../../components/svgIcons.dart';
import '../../../constants.dart';
import '../../../net/flutterfire.dart';
import '../../../sizeConfig.dart';
import '../../forgotPasswordSreen/forgotPassword.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  final formKey = GlobalKey<FormState>();
  late String email;
  late String password;

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
        SizedBox(height: getScreenHeight(10),),
        Errors(errors: errors),
        SizedBox(height: getScreenHeight(3),),
        Row(
          children: [
            Checkbox(
              activeColor: const Color.fromARGB(255, 34, 141, 52),
              value: rememberMe, 
              onChanged: (value){setState(() {
              rememberMe = value!;
            });}
            ),
            Text("Remember Me", style: TextStyle(fontSize: getScreenWidth(14)),),
            const Spacer(),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ForgotPasswordScreen())),
              //onTap: () => Navigator.popAndPushNamed(context, ForgotPasswordScreen.routeName),
              child: const Text("Forgot Password", style: TextStyle(decoration: TextDecoration.underline, color: Color.fromARGB(255, 127, 164, 228)))),
          ],
        ),
        
        SizedBox(height: getScreenHeight(10),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(63)),
          child: DefaultButton(
            text: "Login",
            pressed: ()async{
              bool shouldNavigate = await signIn(_emailField.text, _passwordField.text,);
                if(formKey.currentState!.validate()){
                  if(shouldNavigate){
                  
                  Navigator.pushNamed(context, HomeScreen.routeName);
                }
                  formKey.currentState!.save();
                }
            },
            ),
        ),
      ]),
    );
  }


  TextFormField passwordFormField() {
    return TextFormField(
      controller: _passwordField,
      //----To save the value entered once it has logged in
        onSaved: (newValue) => password = newValue!,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(nullPasswordError)){
            setState(() {
              errors.remove(nullPasswordError);
            });
          } else if(value.length >= 8 && errors.contains(shortPasswordError)){
            setState(() {
              errors.remove(shortPasswordError);
            });
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(nullPasswordError)){
            setState(() {
              errors.add(nullPasswordError);
            });
          } else if(value.length < 8 && !errors.contains(shortPasswordError)){
            setState(() {
              errors.add(shortPasswordError);
            });
          }
          return null;
        },
        obscureText: true,
        decoration: const InputDecoration(
          labelStyle: TextStyle(fontSize: 17, color: Color.fromARGB(255, 42, 45, 46)),
          hintStyle: TextStyle(fontSize: 13),
          labelText: "Password",
          hintText: "Enter Your Password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg",)
        ),
      );
  }

  TextFormField emailFormField() {
    return TextFormField(
      controller: _emailField,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => email = newValue!,
        //------------various form entry errors----------------------------------
        
        validator: (value){
          if (value!.isEmpty && !errors.contains(nullEmailError)){
            setState(() {
              errors.add(nullEmailError);
            });
          } else if(!emailValidatorRegExp.hasMatch(value) && !errors.contains(invalidEmailEnteredError)){
            setState(() {
              errors.add(invalidEmailEnteredError);
            });
          }
          return null;
          
        },
        onChanged: (value){
          if (value.isNotEmpty && errors.contains(nullEmailError)){
            setState(() {
              errors.remove(nullEmailError);
            });
          } else if(emailValidatorRegExp.hasMatch(value) && errors.contains(invalidEmailEnteredError)){
            setState(() {
              errors.remove(invalidEmailEnteredError);
            });
          }
          return null;
        },
          // TODO
        decoration: const InputDecoration(
          labelStyle: TextStyle(fontSize: 17, color: Color.fromARGB(255, 42, 45, 46)),
          hintStyle: TextStyle(fontSize: 13),
          labelText: "Email",
          hintText: "Enter Your Email address",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg",)
        ),
      );
  }
}

