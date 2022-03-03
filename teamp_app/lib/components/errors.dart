import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teamp_app/sizeConfig.dart';

class errorsForm extends StatelessWidget {
  const errorsForm({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(errors.length, (index) => errorsMethod(error: errors[index])),
    );
  }

  Row errorsMethod({String? error}) {
    return Row(
        children: [
          SvgPicture.asset(
            "assets/icons/Error.svg", height: getScreenHeight(14), width: getScreenWidth(14),),
          SizedBox(
            width: getScreenHeight(12),
          ),
          Text(error!),

        ],
      );
  }
}