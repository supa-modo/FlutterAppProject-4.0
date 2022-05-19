import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:teamp_app/screens/PricesWebView/pricesWebView.dart';

import '../../../components/defaultButton.dart';
import '../../../components/sectionTitle.dart';
import '../../../constants.dart';
import '../../../net/api_methods.dart';
import '../../../notifier/notifier.dart';
import '../../../sizeConfig.dart';
import '../../ImageViewScreen/imageView.dart';
import '../../productDetailsScreen/productDetailsScreen.dart';

class ItemsView extends StatefulWidget {
  @override
  State<ItemsView> createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  @override
  void initState() {
    ProductsNotifier productsNotifier =
        Provider.of<ProductsNotifier>(context, listen: false);
    getProducts(productsNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductsNotifier productsNotifier = Provider.of<ProductsNotifier>(context);

    return Container(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(10)),
          child: SizedBox(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/Vegetables.webp")),
                    borderRadius: BorderRadius.circular(getScreenWidth(18))),
              ),
              height: getScreenHeight(225)),
        ),
        SizedBox(height: getScreenHeight(5)),
        Container(
          height: getScreenHeight(102),
          width: getScreenWidth(400),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getScreenWidth(30), vertical: getScreenHeight(2)),
            child: const MarketPriceSellProduct(),
          ),
        ),
        SizedBox(height: getScreenHeight(10)),
        sectionTitleHeader(
          text: "Products",
          pressed: () {},
        ),
        // SizedBox(height: getScreenHeight(1)),
        Padding(
          padding: EdgeInsets.only(top: getScreenHeight(3)),
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: productsNotifier.productsList.length,
              itemBuilder: ((context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: getScreenWidth(7),
                      right: getScreenWidth(5),
                      bottom: getScreenHeight(7)),
                  child: Row(children: [
                    //image section - not loading, pending fluter clean and pub get to try and solve
                    GestureDetector(
                      onTap: () {
                        productsNotifier.currentProducts =
                            productsNotifier.productsList[index];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProductDetails()));
                      },
                      child: Container(
                        width: getScreenWidth(180),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 175, 175, 175),
                          borderRadius: BorderRadius.circular(getScreenWidth(17)),
                        ),
                        height: getScreenHeight(140),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(getScreenWidth(17)),
                          child: Image.network(
                            productsNotifier.productsList[index].image,
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
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: getScreenHeight(125),
                        width: getScreenWidth(165),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 243, 243, 243),
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
                                Text(productsNotifier.productsList[index].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: getScreenWidth(16),
                                        color: appPrimaryColor)),
                                SizedBox(height: getScreenHeight(2)),
                                Text(
                                    'Kshs.' +
                                        productsNotifier
                                            .productsList[index].price,
                                    style: TextStyle(
                                        fontSize: getScreenWidth(13),
                                        color: Colors.red)),
                                SizedBox(height: getScreenHeight(3)),
                                Text(
                                  productsNotifier
                                      .productsList[index].description,
                                  style: TextStyle(
                                      fontSize: getScreenWidth(12),
                                      color: const Color.fromARGB(
                                          255, 73, 71, 71)),
                                ),
                                SizedBox(height: getScreenHeight(7)),
                                Row(children: [
                                  Icon(
                                    Icons.account_circle_rounded,
                                    color: const Color.fromARGB(
                                        255, 155, 173, 182),
                                    size: getScreenWidth(16),
                                  ),
                                  Text(
                                      productsNotifier
                                          .productsList[index].owner,
                                      style: TextStyle(
                                          fontSize: getScreenWidth(12),
                                          color: const Color.fromARGB(
                                              255, 221, 189, 48))),
                                  SizedBox(width: getScreenWidth(15)),
                                  Icon(
                                    Icons.location_pin,
                                    color:
                                        const Color.fromARGB(197, 247, 64, 64),
                                    size: getScreenWidth(16),
                                  ),
                                  Text(
                                      productsNotifier
                                          .productsList[index].location,
                                      style: TextStyle(
                                          fontSize: getScreenWidth(11),
                                          color: const Color.fromARGB(
                                              255, 104, 158, 252))),
                                ])
                                // Text("First Product",
                                //     style: TextStyle(
                                //         fontWeight: FontWeight.bold,
                                //         fontSize: getScreenWidth(16),
                                //         color: appPrimaryColor)),
                                // SizedBox(height: getScreenHeight(8)),
                                // Text(
                                //   "A little description about the product shiklisjcjncacnakc djdcnisdmds",
                                //   style: TextStyle(fontSize: getScreenWidth(12), color: const Color.fromARGB(255, 73, 71, 71)),
                                // ),
                                // SizedBox(height: getScreenHeight(10)),
                                // Row(
                                //   children: [
                                //     Icon(Icons.account_circle_rounded, color: const Color.fromARGB(255, 155, 173, 182), size: getScreenWidth(16),),
                                //     Text("Product Owner", style: TextStyle(fontSize: getScreenWidth(11), color: const Color.fromARGB(255, 221, 189, 48))),
                                //     SizedBox(width: getScreenWidth(15)),
                                //     Icon(Icons.location_pin, color: const Color.fromARGB(197, 247, 64, 64), size: getScreenWidth(16),),
                                //     Text("Location", style: TextStyle(fontSize: getScreenWidth(11), color: const Color.fromARGB(255, 104, 158, 252))),
                                //   ]
                                // )
                              ]),
                        ),
                      ),
                    ),
                  ]),
                );
              })),
        ),
      ]),
    );
  }
}

class MarketPriceSellProduct extends StatelessWidget {
  const MarketPriceSellProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getScreenWidth(300),
          height: getScreenHeight(46),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 34, 141, 52)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImageViewScreen()),
              );
            },
            child: Text("Sell Your Product",
                style: TextStyle(
                  fontSize: getScreenWidth(16),
                  color: Colors.white,
                )),
          ),
        ),
        SizedBox(height: getScreenHeight(5)),
        SizedBox(
          width: getScreenWidth(300),
          height: getScreenHeight(46),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 34, 141, 52)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PricesWebView()),
              );
            },
            child: Text("Current Market Retail Prices",
                style: TextStyle(
                  fontSize: getScreenWidth(16),
                  color: Colors.white,
                )),
          ),
        ),
      ],
    );
  }
}
