
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../sizeConfig.dart';

class Errors extends StatelessWidget {
  const Errors({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(errors.length, (index) => formErrors(error: errors[index])),
    );
  }

  Row formErrors({String? error}) {
    return Row(
        children: [
          SvgPicture.asset(
            "assets/icons/Error.svg", 
            height: getScreenHeight(12), 
            width: getScreenWidth(12)
            ),
          SizedBox(width: getScreenWidth(10)),
          Text(error!)
        ],
      );
  }
}


