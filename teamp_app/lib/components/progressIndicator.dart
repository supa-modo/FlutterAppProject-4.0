import 'package:flutter/material.dart';
import 'package:teamp_app/constants.dart';


class progressIndicator extends StatelessWidget {
  const progressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(color: appPrimaryColor),
      ),);
  }
}
