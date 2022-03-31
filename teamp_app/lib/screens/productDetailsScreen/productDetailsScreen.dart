import 'package:flutter/material.dart';

import '../../components/productsIcon.dart';
import '../../sizeConfig.dart';

class ProductDetails extends StatelessWidget {
  static String routeName = "/productsDetails";
  const ProductDetails({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                //image: DecorationImage(image: AssetImage("teamp_app/assets/images/tomato.jpg")),
                ),
            )
            ),
          Positioned(
            top: 45,
            left: 20, 
            // right: 20,
            child: ProductIcon(
              icon: Icons.arrow_back_ios,
            ),
          )
        ],
      ),
    );
  }
}