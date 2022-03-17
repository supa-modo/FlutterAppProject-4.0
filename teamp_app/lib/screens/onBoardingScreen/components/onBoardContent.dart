import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../sizeConfig.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key, this.text,
  }) : super(key: key);
  final String? text; //****image

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text("APP NAME",
            style: TextStyle(
              fontSize: getScreenWidth(36),
              color: appPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        Text(text!, textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey)),
        Spacer(),
        // Image.asset("assets\images\splash_1.png",
        // height: 265,

        // ),

      ],
    );
  }
}
