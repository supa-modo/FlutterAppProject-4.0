import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../sizeConfig.dart';

class ProductData extends StatelessWidget {
  const ProductData({
    Key? key,
    required this.name,
    required this.description,
    required this.location, 
    required this.price, 
    required this.owner, 
    required this.phoneNumber,
  }) : super(key: key);
  final String name;
  final String price;
  final String description;
  final String owner;
  final String location;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: getScreenHeight(20)),
        Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: getScreenWidth(20), color: appPrimaryColor)),
        Text("Kshs. " + price, style: TextStyle(fontSize: getScreenWidth(16), color: Color.fromARGB(255, 77, 127, 146))),
        SizedBox(height: getScreenHeight(10)),
        Text("Description",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getScreenWidth(17),
                          color: Color.fromARGB(201, 155, 111, 55))),
                  Text(description,
                      style: TextStyle(
                          fontSize: getScreenWidth(14),
                          color: Color.fromARGB(255, 51, 50, 50))),
        SizedBox(height: getScreenHeight(40)),
        Row(
          
          children: [
            Icon(Icons.account_circle, color: Color.fromARGB(255, 145, 130, 130), size: getScreenWidth(40),),
        Text(owner, style: TextStyle(fontWeight: FontWeight.bold, fontSize: getScreenWidth(16),color: Colors.brown)),
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
            Text(location, style: TextStyle(fontSize: getScreenWidth(14), color: Color.fromARGB(150, 2, 92, 247))),
                ],
              ),
              
              ),
            Row(
              children: [
                Icon(Icons.call_outlined, color: Colors.brown, size: getScreenWidth(16),),
                SizedBox(width: getScreenWidth(3)),
                Text("Contact Seller: " + phoneNumber, style: TextStyle(fontSize: getScreenWidth(13), color: Color.fromARGB(212, 27, 136, 36)),),
              ],
            ),
          ],
        )
        
    ]);
  }
}