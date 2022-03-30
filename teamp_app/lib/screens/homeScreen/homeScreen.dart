import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teamp_app/screens/homeScreen/components/body.dart';
import 'package:teamp_app/screens/homeScreen/components/itemsView.dart';
import 'package:teamp_app/screens/profileScreen/profileScreen.dart';

import '../../components/counterIconButton.dart';
import '../../constants.dart';
import '../../sizeConfig.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/homeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Body(),
      body: Column(
        children: [
          Container(
                  margin: EdgeInsets.only(top: getScreenHeight(45), bottom: getScreenHeight(15), ),//left: getScreenWidth(10)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20),),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  searchField2(),
                  counterIconButton(
                    pressed: () {},
                    svgSrc: "assets/icons/User Icon.svg",
                    numberOfItems: 2,
                  ),
                ],
              ),
              

            ),
          ),
        Expanded(child: SingleChildScrollView(child: ItemsView(),),)
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: const BoxDecoration(
          color: Color.fromARGB(73, 230, 228, 228),

          // boxShadow: BoxShadow(offset: Offset(0, -15))
        ),
        child: SafeArea(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              IconButton(
                  icon: SvgPicture.asset("assets/icons/Location point.svg",
                      color: appPrimaryColor),
                  onPressed: () {}),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  },
                  icon: Icon(
                    Icons.home,
                    color: appPrimaryColor,
                    size: getScreenWidth(25),
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: appPrimaryColor,
                    size: getScreenWidth(25),
                  )),
              // IconButton(icon: SvgPicture.asset("assets/icons/User Icon.svg", color: appPrimaryColor,), onPressed: (){}),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ProfileScreen.routeName);
                  },
                  icon: Icon(
                    Icons.account_circle,
                    color: appPrimaryColor,
                    size: getScreenWidth(28),
                  )),
            ])),
      ),
    );
  }
}

class searchField2 extends StatelessWidget {
  const searchField2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth! * 0.76,
      height: 40,
      decoration: BoxDecoration(
        color: const Color.fromARGB(132, 179, 180, 184),
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextField(
        onChanged: (value) {
          // TODO
          //*************************-------------------------------*****************************
        },
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Search Product",
          hintStyle: TextStyle(fontSize: getScreenWidth(16)),
          prefixIcon: Icon(
            Icons.search,
            size: getScreenWidth(23),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(20),
            vertical: getScreenWidth(14),
          ),
        ),
      ),
    );
  }
}
