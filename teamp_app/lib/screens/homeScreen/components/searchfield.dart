import 'package:flutter/material.dart';

import '../../../sizeConfig.dart';

class searchField extends StatelessWidget {
  const searchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth! *0.76, height: 40,
      decoration: BoxDecoration(
        color: const Color.fromARGB(132, 179, 180, 184),
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextField(
        onChanged: (value){
          // TODO
          //*************************-------------------------------*****************************
        },
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Search Product",
          hintStyle: TextStyle(fontSize: getScreenWidth(16)),
          prefixIcon: Icon(Icons.search, size: getScreenWidth(23),),
          contentPadding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(20),
            vertical: getScreenWidth(14),),
        ),
      ),
      );
  }
}
