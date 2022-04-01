import'package:flutter/material.dart';

import '../sizeConfig.dart';

class ProductIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  ProductIcon({ Key? key, 
  required this.icon, 
  this.backgroundColor = const Color(0xFFfcf4e4), 
  this.iconColor = const Color.fromARGB(255, 66, 65, 63), 
  this.size = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size, 
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor,
        ),
      child: Icon(icon, color: iconColor, size: 17),
    );
  }
}