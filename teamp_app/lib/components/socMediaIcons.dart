import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../sizeConfig.dart';

class socMediaIcon extends StatelessWidget {
  const socMediaIcon({
    Key? key, 
    this.icon, 
    this.pressed,
  }) : super(key: key);
  final String? icon;
  final VoidCallback? pressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getScreenWidth(10)),
        height: getScreenHeight(40), 
        width: getScreenWidth(40),
        padding: EdgeInsets.all(getScreenWidth(12)),
        decoration: BoxDecoration(color: Color(0xFFF5F6F8), shape: BoxShape.circle),
        child: SvgPicture.asset(icon!),
        ),
    );
  }
}
