import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class profileImage extends StatelessWidget {
  const profileImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        clipBehavior: Clip.none, fit: StackFit.expand,
        children: [
          const CircleAvatar(backgroundColor: Color.fromARGB(255, 58, 172, 73)), //AssetImage("assets/images/Profile Image.png"),),
          Positioned(
            bottom: 0,
            right: -10,
            child: SizedBox(
              width: 40, height: 40,
              child: TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFF5F6F9)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50), side: const BorderSide(color: Colors.white))),
                ),
                onPressed: (){},
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}