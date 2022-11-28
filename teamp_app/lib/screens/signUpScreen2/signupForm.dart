import 'package:flutter/material.dart';
import 'package:teamp_app/net/flutterfire.dart';

import '../../components/defaultButton.dart';
import '../../components/errors.dart';
import '../../components/socMediaIcons.dart';
import '../../components/svgIcons.dart';
import '../../constants.dart';
import '../../sizeConfig.dart';
import '../homeScreen/homeScreen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _nameField = TextEditingController();
  final TextEditingController _phoneNumberField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  final TextEditingController _confirmPasswordField = TextEditingController();

  final formKey = GlobalKey<FormState>();
  late String name;
  late String phoneNumber;
  late String email;
  late String password;
  late String confirmPassword;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            height: getScreenHeight(30),
          ),
          nameFormField(),
          SizedBox(
            height: getScreenHeight(15),
          ),
          emailFormField(),
          SizedBox(
            height: getScreenHeight(15),
          ),
          phoneFormField(),
          SizedBox(
            height: getScreenHeight(15),
          ),
          passwordFormField(),
          SizedBox(
            height: getScreenHeight(15),
          ),
          TextFormField(
            controller: _confirmPasswordField,
            obscureText: true,
            // TODO
            //---------------------ADD PASSWORD MATCHING CONFIRMATION-----------------------------------
            // validator: (value) {
            //   if(value == passwordFormField(value)){
            //     errors.add(value)
            //   }
            // },
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
                labelStyle: TextStyle(
                    fontSize: 17, color: Color.fromARGB(255, 42, 45, 46)),
                hintStyle: TextStyle(fontSize: 13),
                labelText: "Confirm Password",
                hintText: "Confirm Your Password",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSuffixIcon(
                  svgIcon: "assets/icons/Lock.svg",
                )),
          ),
          SizedBox(
            height: getScreenHeight(25),
          ),
          Errors(errors: errors),
          SizedBox(
            height: getScreenHeight(5),
          ),
          const Text(
            "**By pressing the Register button you agree to our terms and conditions**",
            style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: getScreenHeight(15),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenWidth(75)),
            child: DefaultButton(
              text: "Register",
              pressed: () async {
                bool shouldNavigate = await signUp(_emailField.text,
                    _passwordField.text, _confirmPasswordField.text);
                if (formKey.currentState!.validate()) {
                  if (shouldNavigate) {
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  }
                  formKey.currentState!.save();
                }
              },
            ),
          ),
          SizedBox(
            height: getScreenHeight(15),
          ),
          const Text("or \nSignup with your social media account",
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
      onSaved: (newValue) => password = newValue!,
      validator: (value) {
        if (value!.isEmpty && !errors.contains(nullPasswordError)) {
          setState(() {
            errors.add(nullPasswordError);
          });
        } else if (value.length < 8 && !errors.contains(shortPasswordError)) {
          setState(() {
            errors.add(shortPasswordError);
          });
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(nullPasswordError)) {
          setState(() {
            errors.remove(nullPasswordError);
          });
        } else if (value.length >= 8 && errors.contains(shortPasswordError)) {
          setState(() {
            errors.remove(shortPasswordError);
          });
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      obscureText: true,
      decoration: const InputDecoration(
          labelStyle:
              TextStyle(fontSize: 17, color: Color.fromARGB(255, 42, 45, 46)),
          hintStyle: TextStyle(fontSize: 13),
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
      onSaved: (newValue) => email = newValue!,
      validator: (value) {
        if (value!.isEmpty && !errors.contains(nullEmailError)) {
          setState(() {
            errors.add(nullEmailError);
          });
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(invalidEmailEnteredError)) {
          setState(() {
            errors.add(invalidEmailEnteredError);
          });
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(nullEmailError)) {
          setState(() {
            errors.remove(nullEmailError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(invalidEmailEnteredError)) {
          setState(() {
            errors.remove(invalidEmailEnteredError);
          });
        }
        return null;
      },
      decoration: const InputDecoration(
          labelStyle:
              TextStyle(fontSize: 17, color: Color.fromARGB(255, 42, 45, 46)),
          hintStyle: TextStyle(fontSize: 13),
          labelText: "Email",
          hintText: "Enter Your Email address",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: "assets/icons/Mail.svg",
          )),
    );
  }

  TextFormField phoneFormField() {
    return TextFormField(
      controller: _phoneNumberField,
      //----To save the value entered once it has logged in
      onSaved: (newValue) => phoneNumber = newValue!,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
          labelStyle:
              TextStyle(fontSize: 17, color: Color.fromARGB(255, 42, 45, 46)),
          hintStyle: TextStyle(fontSize: 13),
          labelText: "Phone Number",
          hintText: "Enter Your Phone Number",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: "assets/icons/Phone.svg",
          )),
    );
  }

  TextFormField nameFormField() {
    return TextFormField(
      controller: _nameField,
      //----To save the value entered once it has logged in
      onSaved: (newValue) => name = newValue!,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
          labelStyle:
              TextStyle(fontSize: 17, color: Color.fromARGB(255, 42, 45, 46)),
          hintStyle: TextStyle(fontSize: 13),
          labelText: "Name",
          hintText: "Enter Your Name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: "assets/icons/User Icon.svg",
          )),
    );
  }
}
