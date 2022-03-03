import 'package:flutter/material.dart';

import '../sizeConfig.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key, 
    this.text, 
    this.pressed,
  }) : super(key: key);
  final String? text;
  final VoidCallback? pressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getScreenHeight(56),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 34, 141, 52)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
          ),
        ),
        onPressed: pressed,
      child: Text(text!, style: TextStyle(fontSize: getScreenWidth(17), color: Colors.white,)),
      ),
    );
  }
}

