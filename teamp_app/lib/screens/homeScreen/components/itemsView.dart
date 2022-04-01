import "package:flutter/material.dart";

import '../../../components/defaultButton.dart';
import '../../../components/sectionTitle.dart';
import '../../../constants.dart';
import '../../../sizeConfig.dart';
import '../../ImageViewScreen/imageView.dart';

class ItemsView extends StatefulWidget {
  const ItemsView({Key? key}) : super(key: key);

  @override
  State<ItemsView> createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
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
        // SizedBox(height: getScreenHeight(1)),
          ListView.builder(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: ((context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: getScreenWidth(7),
                      right: getScreenWidth(5),
                      bottom: getScreenHeight(7)),
                  child: Row(children: [
                    //image section - not loading, pending fluter clean and pub get to try and solve
                    Container(
                        width: getScreenWidth(180),
                        height: getScreenHeight(140),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(getScreenWidth(17)),
                          //color: Colors.redAccent,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/Image Banner 2.png")),
                        ),),
                    Expanded(
                      child: Container(
                        height: getScreenHeight(120),
                        width: getScreenWidth(165),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 243, 243, 243),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(getScreenWidth(15)),
                            bottomRight: Radius.circular(getScreenWidth(15)),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: getScreenWidth(5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text("First Product",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getScreenWidth(16),
                                    color: appPrimaryColor)),
                            SizedBox(height: getScreenHeight(8)),
                            Text(
                              "A little description about the product shiklisjcjncacnakc djdcnisdmds",
                              style: TextStyle(fontSize: getScreenWidth(12), color: Color.fromARGB(255, 73, 71, 71)),
                            ),
                            SizedBox(height: getScreenHeight(10)),
                            Row(
                              children: [
                                Icon(Icons.account_circle_rounded, color: Color.fromARGB(255, 155, 173, 182), size: getScreenWidth(16),),
                                Text("Product Owner", style: TextStyle(fontSize: getScreenWidth(11), color: Color.fromARGB(255, 104, 158, 252))),
                                SizedBox(width: getScreenWidth(15)),
                                Icon(Icons.gps_fixed_rounded, color: Color.fromARGB(255, 253, 128, 120), size: getScreenWidth(16),),
                                Text("Location", style: TextStyle(fontSize: getScreenWidth(11), color: Color.fromARGB(255, 221, 189, 48))),
                              ]
                            )
                          ]),
                        ),
                      ),
                    ),
                  ]),
                );
              })),
      ]),
    );
  }
}
