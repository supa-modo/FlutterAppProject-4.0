import 'package:flutter/material.dart';

import '../sizeConfig.dart';

class sectionTitleHeader extends StatelessWidget {
  const sectionTitleHeader({
    Key? key, 
    required this.text, 
    required this.pressed,
  }) : super(key: key);

  final String text;
  final GestureTapCallback pressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(fontSize: getScreenWidth(17), color: const Color.fromARGB(255, 34, 141, 52))),
          GestureDetector(
            child: Text("See More", style: TextStyle(color: Color.fromARGB(255, 114, 168, 197), fontSize: getScreenWidth(14))),
            onTap: pressed,
          ),
        ]
      ),
    );
  }
}


