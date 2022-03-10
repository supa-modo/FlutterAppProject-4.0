import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teamp_app/screens/homeScreen/components/productsPgView.dart';
import 'package:teamp_app/screens/homeScreen/components/searchfield.dart';
import 'package:teamp_app/screens/profileScreen/profileScreen.dart';
import 'package:teamp_app/sizeConfig.dart';

import '../../../components/counterIconButton.dart';
import '../../../components/defaultButton.dart';
import '../../../components/sectionTitle.dart';
import '../../homeScreen/components/productsPgView.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
      children: [
        SizedBox(height: getScreenHeight(15)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              searchField(),
              // counterIconButton(
              //   pressed: () {},
              //   svgSrc: "assets/icons/Cart Icon.svg",
              //   numberOfItems: 8,
              // ),
              counterIconButton(
                pressed: () {
                  Navigator.pushNamed(context, ProfileScreen.routeName);
                },
                svgSrc: "assets/icons/User.svg",
              ),
            ],
          ),
        ),
        SizedBox(height: getScreenHeight(10)),
        ProductPageView(),
        SizedBox(height: getScreenHeight(10)),
        //-----------------------------------------------------------------------------------------------
        //2.01 pending modify to slider package provided by flutter
        SliderDots(),
        //---------------------------------------------------------------------------------------------------
        //13.00 check flutter way
        SizedBox(height: getScreenHeight(10)),
        Container(
          height: getScreenHeight(52),
          width: getScreenWidth(400),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenWidth(30), vertical: getScreenHeight(2)),
            child: DefaultButton(
              text: "Sell Your Product",
              pressed: () {},
            ),
          ),
        ),
        SizedBox(height: getScreenHeight(10)),
        sectionTitleHeader(
          text: "Popular",
          pressed: () {},
        ),
        //16.51 pending adding categories-------------------------------------------------------------------
      ],
    )));
  }
}

class SliderDots extends StatelessWidget {
  const SliderDots({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: DotsIndicator(
        dotsCount: 5,
        // TODO 
        // check on slider position error
        position: 1,//currentPageIndex,
        decorator: DotsDecorator(
          activeColor: appPrimaryColor,
          size: Size.square(getScreenWidth(6.0)),
          activeSize: Size(getScreenWidth(14.0), getScreenHeight(7.0)),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)),
          spacing: EdgeInsets.symmetric(horizontal: getScreenWidth(4.0)),
        ),
      ),
    );
  }
}
