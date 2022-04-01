import 'package:flutter/material.dart';

import '../../sizeConfig.dart';

class ExtendableText extends StatefulWidget {
  final String text;
  const ExtendableText({ Key? key, required this.text }) : super(key: key);

  @override
  State<ExtendableText> createState() => _ExtendableTextState();
}

class _ExtendableTextState extends State<ExtendableText> {
  late String firstHalf;
  late String secomdHalf;

bool hiddenText = true;
double textHeight = getScreenHeight(50);
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}