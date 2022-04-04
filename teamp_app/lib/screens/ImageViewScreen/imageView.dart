//import 'dart:html';

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../constants.dart';
import '../../sizeConfig.dart';
import 'components/body.dart';

class ImageViewScreen extends StatefulWidget {
  static String routeName = "/imageViewScreen";
  ImageViewScreen({Key? key}) : super(key: key);

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _productNameField = TextEditingController();
  TextEditingController _descriptionField = TextEditingController();
  TextEditingController _productPriceField = TextEditingController();
  TextEditingController _phoneField = TextEditingController();
  TextEditingController _nearestLocationField = TextEditingController();

  File? _image;
  // File? _image2;
  // File? _image3;
  final imagePicker = ImagePicker();

  Future imagePickerMethod() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        showSnackBar("No file selected", Duration(milliseconds: 600));
      }
    });
  }

  showSnackBar(String snackBarText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackBarText),
      duration: d,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Upload Your Product",
            style: TextStyle(
              color: appPrimaryColor,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: appPrimaryColor),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getScreenWidth(25)),
                        child: Container(
                          width: getScreenWidth(200),
                          height: getScreenHeight(220),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: appPrimaryColor,
                          )),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: _image == null
                                      ? Center(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: getScreenHeight(5)),
                                                child: Text(
                                                    "Choose image to upload", style: TextStyle(color: Color.fromARGB(255, 128, 125, 125)),),
                                              ),
                                              SizedBox(
                                                  height: getScreenHeight(50)),
                                              OutlinedButton(
                                                style: ButtonStyle(
                                                  side: MaterialStateProperty
                                                      .all<BorderSide>(
                                                          BorderSide(
                                                    color: Color.fromARGB(255, 235, 231, 231)
                                                        .withOpacity(0.5),
                                                    width: getScreenWidth(2.5),
                                                  )),
                                                ),
                                                onPressed: () {
                                                  imagePickerMethod();
                                                },
                                                child: const Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      14, 20, 14, 20),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: appPrimaryColor,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ), //Text("No image selected"),
                                        )
                                      : Image.file(_image!, fit: BoxFit.cover),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.only(bottom: getScreenHeight(2), top: getScreenHeight(3)),
                                //   child: TextButton(
                                //     style: ButtonStyle(
                                //       backgroundColor: MaterialStateProperty.all<
                                //               Color>(
                                //           const Color.fromARGB(255, 34, 141, 52)),
                                //       shape: MaterialStateProperty.all<
                                //               RoundedRectangleBorder>(
                                //           RoundedRectangleBorder(
                                //               borderRadius:
                                //                   BorderRadius.circular(10))),
                                //     ),
                                //     onPressed: () {
                                //       imagePickerMethod();
                                //     },
                                //     child: Text("Select Image", style: TextStyle(fontSize: getScreenWidth(13), color: Colors.white)),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        //------------------------------------------------------------------------------------
                        //       child: OutlinedButton(
                        //         style: ButtonStyle(
                        //           side: MaterialStateProperty.all<BorderSide>(
                        //               BorderSide(
                        //             color: Colors.grey.withOpacity(0.5),
                        //             width: getScreenWidth(2.5),
                        //           )),
                        //         ),
                        //         onPressed: () {
                        //           imagePickerMethod();
                        //           // _selectImage(
                        //           //     ImagePicker.pickImage(source: ImageSource.gallery), 1);
                        //         },
                        //         child: const Padding(
                        //           padding: EdgeInsets.fromLTRB(14, 70, 14, 70),
                        //           child: Icon(
                        //             Icons.add,
                        //             color: appPrimaryColor,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),

                        // Expanded(
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(horizontal: getScreenWidth(2 )),
                        //     child: OutlinedButton(
                        //       style: ButtonStyle(
                        //         side: MaterialStateProperty.all<BorderSide>(
                        //             BorderSide(
                        //           color: Colors.grey.withOpacity(0.5),
                        //           width: getScreenWidth(2.5),
                        //         )),
                        //       ),
                        //       onPressed: () {
                        //         imagePickerMethod();
                        //         // _selectImage(
                        //         //     ImagePicker.pickImage(source: ImageSource.gallery), 2);
                        //       },
                        //       child: const Padding(
                        //         padding: EdgeInsets.fromLTRB(14, 70, 14, 70),
                        //         child: Icon(
                        //           Icons.add,
                        //           color: appPrimaryColor,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Expanded(
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(horizontal: getScreenWidth(5)),
                        //     child: OutlinedButton(
                        //       style: ButtonStyle(
                        //         side: MaterialStateProperty.all<BorderSide>(
                        //             BorderSide(
                        //           color: Colors.grey.withOpacity(0.5),
                        //           width: getScreenWidth(2.5),
                        //         )),
                        //       ),
                        //       onPressed: () {
                        //         imagePickerMethod();
                        //         // _selectImage(
                        //         //     ImagePicker.pickImage(source: ImageSource.gallery), 3);
                        //       },
                        //       child: const Padding(
                        //         padding: EdgeInsets.fromLTRB(14, 70, 14, 70),
                        //         child: Icon(
                        //           Icons.add,
                        //           color: appPrimaryColor,
                        //         ),
                        //       ),
                        //     ),
                        //---------------------------------------------------------------------------------------
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getScreenHeight(15),
                ),
                TextFormField(
                    controller: _productNameField,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                      enabledBorder: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(),
                      border: UnderlineInputBorder(),
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: appPrimaryColor,
                          fontWeight: FontWeight.bold),
                      hintStyle: TextStyle(fontSize: 12),
                      labelText: "Product Name",
                      hintText: "Name of your product",
                    )),
                SizedBox(
                  height: getScreenHeight(20),
                ),
                TextFormField(
                  controller: _descriptionField,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                      enabledBorder: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(),
                      border: UnderlineInputBorder(),
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: appPrimaryColor,
                          fontWeight: FontWeight.bold),
                      hintStyle: TextStyle(fontSize: 12),
                      labelText: "Product Description",
                      hintText: "Brief Description of your product"),
                ),
                SizedBox(
                  height: getScreenHeight(20),
                ),
                TextFormField(
                  controller: _productPriceField,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                      enabledBorder: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(),
                      border: UnderlineInputBorder(),
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: appPrimaryColor,
                          fontWeight: FontWeight.bold),
                      hintStyle: TextStyle(fontSize: 12),
                      labelText: "Product Price",
                      hintText: "Price of your product"),
                ),
                SizedBox(
                  height: getScreenHeight(20),
                ),
                TextFormField(
                  controller: _phoneField,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                      enabledBorder: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(),
                      border: UnderlineInputBorder(),
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: appPrimaryColor,
                          fontWeight: FontWeight.bold),
                      hintStyle: TextStyle(fontSize: 12),
                      labelText: "Your Phone Number",
                      hintText: "Enter your contact details"),
                ),
                SizedBox(
                  height: getScreenHeight(20),
                ),
                TextFormField(
                  controller: _nearestLocationField,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                      enabledBorder: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(),
                      // border: UnderlineInputBorder(),
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: appPrimaryColor,
                          fontWeight: FontWeight.bold),
                      hintStyle: TextStyle(fontSize: 12),
                      labelText: "Nearest Location",
                      hintText: "Location of your product"),
                ),
                SizedBox(
                  height: getScreenHeight(15),
                ),
                SizedBox(
                  height: getScreenHeight(52),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getScreenWidth(50),
                        vertical: getScreenHeight(2)),
                    child: TextButton(
                      onPressed: () {
                        validateAndUpload();
                      },
                      child: Text(
                        "Upload",
                        style: TextStyle(
                            fontSize: getScreenWidth(16), color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 34, 141, 52)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                        fixedSize: MaterialStateProperty.all<Size>(
                          Size.fromWidth(200),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // body: Body(),
        ));
  }

  void validateAndUpload() async{
    if(_formKey.currentState!.validate()){
      if(_image != null){
        if(_productNameField != null && _productPriceField != null && _nearestLocationField != null){
          String imageUrl;
          final FirebaseStorage storage = FirebaseStorage.instance;
          final String picture = "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          // StorageUploadTask task = storage.ref().child(picture).putFile(_image!);

          // task.onComplete.then((snapshot) async{
          //   imageUrl = await snapshot.ref.getDownloadUrl();
          // });
        } else{

        }
      } else{
        //FlutterToast.showToast(msg: "You must select an image");
      }
    }
  }
}

  // void _selectImage(Future<XFile?> pickImage, imageNumber) async{
  //   File tempImage = (await pickImage) as File;
  //   switch (ImageNumber){
  //     case 1: setState(() =>  _image1 = tempImage);
  //     break;
  //     case 2: setState(() =>  _image2 = tempImage);
  //     break;
  //     case 3: setState(() =>  _image3 = tempImage);
  //     break;
  //   }
  // }




  


