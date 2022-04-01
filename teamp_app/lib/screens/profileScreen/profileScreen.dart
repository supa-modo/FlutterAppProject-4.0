import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../../sizeConfig.dart';
import '../homeScreen/homeScreen.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profileScreen";
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: appPrimaryColor),
        onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Body(),
      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.symmetric(vertical: 4),
      //   decoration: const BoxDecoration(
      //     color: Color.fromARGB(73, 230, 228, 228),

      //     // boxShadow: BoxShadow(offset: Offset(0, -15))
      //   ),
      //   child: SafeArea(
      //       child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: [
      //         IconButton(
      //             icon: SvgPicture.asset("assets/icons/Location point.svg",
      //                 color: appPrimaryColor),
      //             onPressed: () {}),
      //         IconButton(
      //             onPressed: () {
      //               Navigator.pushNamed(context, HomeScreen.routeName);
      //             },
      //             icon: Icon(
      //               Icons.home,
      //               color: appPrimaryColor,
      //               size: getScreenWidth(25),
      //             )),
      //         IconButton(
      //             onPressed: () {
                    
      //             },
      //             icon: Icon(
      //               Icons.notifications,
      //               color: appPrimaryColor,
      //               size: getScreenWidth(25),
      //             )),
      //         // IconButton(icon: SvgPicture.asset("assets/icons/User Icon.svg", color: appPrimaryColor,), onPressed: (){}),
      //         IconButton(
      //             onPressed: () {
      //               Navigator.pushNamed(context, ProfileScreen.routeName);
      //             },
      //             icon: Icon(
      //               Icons.account_circle,
      //               color: appPrimaryColor,
      //               size: getScreenWidth(28),
      //             )),
      //       ])),
      // ),
    );
  }
}