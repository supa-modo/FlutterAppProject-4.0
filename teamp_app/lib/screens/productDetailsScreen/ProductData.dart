import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../sizeConfig.dart';

class ProductData extends StatelessWidget {
  const ProductData({
    Key? key,
    required this.ProductName,
    required this.Description,
    required this.Location, 
    required this.ProductPrice, 
    required this.ProductOwner, 
    required this.PhoneNumber,
  }) : super(key: key);
  final String ProductName;
  final String ProductPrice;
  final String Description;
  final String ProductOwner;
  final String Location;
  final String PhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: getScreenHeight(20)),
        Text(ProductName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: getScreenWidth(20), color: appPrimaryColor)),
        Text("Kshs. " + ProductPrice, style: TextStyle(fontSize: getScreenWidth(16), color: Color.fromARGB(255, 77, 127, 146))),
        SizedBox(height: getScreenHeight(10)),
        Text("Description",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getScreenWidth(17),
                          color: Color.fromARGB(201, 155, 111, 55))),
                  Text(Description,
                      style: TextStyle(
                          fontSize: getScreenWidth(14),
                          color: Color.fromARGB(255, 51, 50, 50))),
        SizedBox(height: getScreenHeight(40)),
        Row(
          
          children: [
            Icon(Icons.account_circle, color: Color.fromARGB(255, 168, 151, 151), size: getScreenWidth(40),),
        Text(ProductOwner, style: TextStyle(fontWeight: FontWeight.bold, fontSize: getScreenWidth(15),)),
            SizedBox(width: getScreenWidth(120)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: getScreenWidth(20),),
              child: Row(
                children: [
                  Icon(Icons.location_pin, color: Color.fromARGB(255, 204, 108, 108), size: getScreenWidth(16),),
                  SizedBox(width: getScreenWidth(7)),
            Text(Location, style: TextStyle(fontSize: getScreenWidth(14), color: Color.fromARGB(150, 2, 92, 247))),
                ],
              ),
              
              ),
            Text("Contact Seller: " + PhoneNumber, style: TextStyle(fontSize: getScreenWidth(13), color: Color.fromARGB(212, 27, 136, 36)),),
          ],
        )
        
    ]);
  }
}