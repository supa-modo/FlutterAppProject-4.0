import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key, 
    required this.text, 
    required this.icon, 
    required this.pressed,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback pressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextButton(
        style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(20)),
        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(97, 211, 211, 211)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
        ),
      ),
        onPressed: pressed, 
        child: Row(
          children: [
            SvgPicture.asset(icon, width: 20, color: appPrimaryColor,),
            SizedBox(width: 20,),
            Expanded(child: Text(text, style: Theme.of(context).textTheme.bodyText1,)),
            Icon(Icons.arrow_forward_ios, size: 15, color: Colors.grey),
          ]
        )),
    );
  }
}

