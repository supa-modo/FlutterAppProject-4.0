// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../sizeConfig.dart';

// class FormErros extends StatelessWidget {
//   const FormErros({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: List.generate(errors.length, (index) => formErrorText(error: errors[index]))
//     );
//   }

//   Row formErrorText({String? error}) {
//     return Row(
//         children: [
//           SvgPicture.asset("assets/icons/Error.svg", height: getScreenHeight(12), width: getScreenWidth(12)),
//           SizedBox(width: getScreenWidth(10)),
//           Text(error!)
//         ]
//       );
//   }
// }