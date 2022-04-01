import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teamp_app/screens/SignInScreen/signInScreen.dart';

import '../../../constants.dart';
import '../../../sizeConfig.dart';
import '../../homeScreen/homeScreen.dart';
import '../../signUpScreen2/signUp.dart';
import 'profileImage.dart';
import 'profileMenu.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        profileImage(),
        SizedBox(height: 20),
        ProfileMenu(
          text: "Back to HomeScreen", 
          icon: "assets/icons/Shop Icon.svg", 
          pressed: (){},//Navigator.pop(context, HomeScreen.routeName)
          ),
        ProfileMenu(
          icon: "assets/icons/User Icon.svg",
          text: "My Account",
          pressed: (){},
        ),
        ProfileMenu(
          icon: "assets/icons/User Icon.svg",
          text: "My Account",
          pressed: (){},
        ),ProfileMenu(
          icon: "assets/icons/Question mark.svg",
          text: "Get Help",
          pressed: (){},
        ),
        ProfileMenu(
          icon: "assets/icons/Settings.svg",
          text: "Settings",
          pressed: (){},
        ),
        
        ProfileMenu(
          icon: "assets/icons/Log out.svg",
          text: "Log Out",
          pressed: (){
            FirebaseAuth.instance.signOut().then((value) {
              Navigator.pushNamed(context, SignInScreen.routeName);
            });
          },
        ),
      ],
    );
  }
}

