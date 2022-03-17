// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../../constants.dart';
// import '../../../sizeConfig.dart';

// class Body extends StatelessWidget {
//   //const Body({ Key? key }) : super(key: key);
//   File? _image1;
//   File? _image2;
//   File? _image3;
//   final imagePicker = ImagePicker();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(height: getScreenHeight(30)),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: getScreenWidth(10)),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: SizedBox(
//                   height: getScreenHeight(200), width: getScreenWidth(200),
//                   child: Container(
//                     width: getScreenWidth(100),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(color: appPrimaryColor),
//                     ),
//                     child: Center( 
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           // Expanded(
//                           //   child: _image == null
//                           //     ?const Center(
//                           //       child: Text("No Image Selected", style: TextStyle(fontSize: 10),),
//                           //       ) : Image.file(_image),
//                           //   ),
//                           ElevatedButton(onPressed: (){}, child: Text("Select Image")),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
              
//             ],
//           ),
//         ),
        
//       ],
//     );
//   }
// }