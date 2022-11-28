import 'package:flutter/material.dart';
import 'package:teamp_app/notifier/notifier.dart';
import 'package:teamp_app/sizeConfig.dart';

import '../../../components/counterIconButton.dart';
import '../../../components/defaultButton.dart';
import '../../../components/sectionTitle.dart';
import '../../ImageViewScreen/imageView.dart';

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
        Container(
          height: getScreenHeight(52),
          width: getScreenWidth(400),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getScreenWidth(30), vertical: getScreenHeight(2)),
            child: DefaultButton(
              text: "Sell Your Product",
              pressed: () {
                ProductsNotifier().currentProducts = null;
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
        Container(
          height: getScreenHeight(700),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: ((context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: getScreenWidth(20), right: getScreenWidth(20)),
                  child: Row(children: [
                    Container(
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(getScreenWidth(17)),
                      color: Colors.white38,
                      image: DecorationImage(
                          image:
                              AssetImage("teamp_app/assets/images/tomato.jpg")),
                    )),
                  ]),
                );
              })),
        ),
      ],
      // ),
    ));
  }
}
