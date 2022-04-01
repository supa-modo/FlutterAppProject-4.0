import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teamp_app/screens/homeScreen/components/productsPgView.dart';
import 'package:teamp_app/screens/profileScreen/profileScreen.dart';
import 'package:teamp_app/sizeConfig.dart';

import '../../../components/counterIconButton.dart';
import '../../../components/defaultButton.dart';
import '../../../components/sectionTitle.dart';
import '../../ImageViewScreen/imageView.dart';
import '../../homeScreen/components/productsPgView.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
        //child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getScreenHeight(15)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //searchField(),
                  counterIconButton(
                    pressed: () {},
                    svgSrc: "assets/icons/User Icon.svg",
                    numberOfItems: 2,
                  ),
                ],
              ),
            ),
            SizedBox(height: getScreenHeight(10)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getScreenWidth(10)),
              child: SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(getScreenWidth(18))),
                  
                ),
                height: getScreenHeight(250)),
            ),
            SizedBox(height: getScreenHeight(10)),

            // ProductPageView(),
            // SizedBox(height: getScreenHeight(10)),
            //-----------------------------------------------------------------------------------------------
            //2.01 pending modify to slider package provided by flutter
            // SliderDots(),
            //---------------------------------------------------------------------------------------------------
            //13.00 check flutter way
            // SizedBox(height: getScreenHeight(10)),
            Container(
              height: getScreenHeight(52),
              width: getScreenWidth(400),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getScreenWidth(30), vertical: getScreenHeight(2)),
                child: DefaultButton(
                  text: "Sell Your Product",
                  pressed: () {
                    Navigator.pushNamed(context, ImageViewScreen.routeName);
                  },
                ),
              ),
            ),
            SizedBox(height: getScreenHeight(10)),
            sectionTitleHeader(
              text: "Products",
              pressed: () {},
            ),
            SizedBox(height: getScreenHeight(25)),
            // Container(
            //   height: getScreenHeight(900),
            //     // child: ListView.builder(
            //     //   itemBuilder: (context, index) {
            //     //     return Container(
            //     //       margin: EdgeInsets.only(left: getScreenWidth(20), right: getScreenWidth(20)),
            //     //       child: Row(
            //     //         children: [
            //     //           Container(
            //     //             width: 120,
            //     //             height: 120,
            //     //             decoration: BoxDecoration(
            //     //               borderRadius: BorderRadius.circular(getScreenWidth(15)),
            //     //               color: Colors.white38,
            //     //               //image: AssetImage("assets/images/tomato.jpg")
            //     //             ),
            //     //           ),
            //     //         ]
            //     //       )
            //     //     );
            //     //    }),
            // ),
            Container(
              height: getScreenHeight(700),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: ((context, index) {
                return Container(
                  margin: EdgeInsets.only(left: getScreenWidth(20), right: getScreenWidth(20)),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(getScreenWidth(17)),
                          color: Colors.white38,
                          image: DecorationImage(image: AssetImage("teamp_app/assets/images/tomato.jpg")),
                        )
                      ),
                    ]
                  ),
                );
              })),
            ),
            //16.51 pending adding categories-------------------------------------------------------------------
          ],
        // ),
      ));
    
  }
}

// class SliderDots extends StatelessWidget {
//   const SliderDots({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 4),
//       child: DotsIndicator(
//         dotsCount: 5,
//         // TODO
//         // check on slider position error
//         position: 1, //currentPageIndex,
//         decorator: DotsDecorator(
//           activeColor: appPrimaryColor,
//           size: Size.square(getScreenWidth(6.0)),
//           activeSize: Size(getScreenWidth(14.0), getScreenHeight(7.0)),
//           activeShape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//           spacing: EdgeInsets.symmetric(horizontal: getScreenWidth(4.0)),
//         ),
//       ),
//     );
//   }
// }
