import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../sizeConfig.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, getScreenWidth(17), getScreenWidth(17), getScreenWidth(17),),
      child: SvgPicture.asset(svgIcon, height: getScreenHeight(16),),
    );
  }
}