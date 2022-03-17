import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../sizeConfig.dart';

class counterIconButton extends StatelessWidget {
  const counterIconButton({
    Key? key, 
    required this.svgSrc, 
    this.numberOfItems, 
    required this.pressed,
  }) : super(key: key);

  final String svgSrc;
  final int? numberOfItems;
  final GestureTapCallback pressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      borderRadius: BorderRadius.circular(50),
    child: Stack(
      clipBehavior: Clip.none, children: [
        Container(
          padding: EdgeInsets.all(getScreenWidth(10)),
          width: getScreenWidth(37), height: getScreenWidth(37),
          decoration: const BoxDecoration(
            color: Color.fromARGB(132, 179, 180, 184),
            //borderRadius: BorderRadius.circular(14),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(svgSrc),
        ),

        if(numberOfItems!=0)
        Positioned(
          right: 0,
          top: -3,
          child: Container(
            height: getScreenHeight(16), width: getScreenWidth(16), 
            decoration: BoxDecoration(
              // color: Color.fromARGB(255, 247, 101, 101),
              color: const Color.fromARGB(193, 34, 141, 52),
              shape: BoxShape.circle,
              border: Border.all(width: 1.5, color: Colors.white),
            ),
            child: Center(
              child: Text("$numberOfItems", style: TextStyle(color: Colors.white, height: 1, fontSize: getScreenWidth(9), fontWeight: FontWeight.w600),),
            ),
          ),
        )
      ],
    ),
                  );
  }
}