import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamp_app/screens/productDetailsScreen/ProductData.dart';

import '../../components/productsIcon.dart';
import '../../constants.dart';
import '../../notifier/notifier.dart';
import '../../sizeConfig.dart';

class ProductDetails extends StatelessWidget {
  static String routeName = "/productsDetails";
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ProductsNotifier productsNotifier = Provider.of<ProductsNotifier>(context, listen: false);
    
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 300,
                child: ClipRRect(
                          borderRadius: BorderRadius.circular(getScreenWidth(17)),
                          child: Image.network(
                            productsNotifier.currentProducts!.image,
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: SizedBox(
                                  width: getScreenWidth(25),
                                  height: getScreenHeight(25),
                                  child: CircularProgressIndicator(
                                    color: appPrimaryColor,
                                    strokeWidth: 3.5,
                                    backgroundColor: Color.fromARGB(255, 192, 192, 192),
                                    value: loadingProgress.expectedTotalBytes != null? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!: null,

                                  ),
                                ),
                              );
                            },
                          ),
                        ),
              )),
          Positioned(
            top: 45,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: ProductIcon(
                icon: Icons.arrow_back_ios_new,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: getScreenHeight(300),
            bottom: 0,
            //height: getScreenHeight(600),
            child: Container(
              padding: EdgeInsets.only(
                  left: getScreenWidth(20), right: getScreenWidth(20)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(getScreenWidth(25)),
                    topLeft: Radius.circular(getScreenWidth(25))),
                color: Color.fromARGB(255, 216, 215, 215),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductData(
                    owner: productsNotifier.currentProducts!.owner,
                    price: productsNotifier.currentProducts!.price,
                    name: productsNotifier.currentProducts!.name,
                    description: productsNotifier.currentProducts!.description,
                    phoneNumber: productsNotifier.currentProducts!.phoneNumber,
                    location: productsNotifier.currentProducts!.location,
                  ),
                  SizedBox(
                    height: getScreenHeight(20),
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
