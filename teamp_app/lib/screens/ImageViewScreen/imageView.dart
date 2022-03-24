// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants.dart';
import '../../sizeConfig.dart';
import 'components/body.dart';

class ImageViewScreen extends StatelessWidget {
  static String routeName = "/imageViewScreen";
  ImageViewScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  TextEditingController _productNameField = TextEditingController();
  TextEditingController _descriptionField = TextEditingController();
  TextEditingController _productPriceField = TextEditingController();
  TextEditingController _phoneField = TextEditingController();
  TextEditingController _nearestLocationField = TextEditingController();

  // late File _image1;
  // late File _image2;
  // late File _image3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Upload Your Product", style: TextStyle(color: appPrimaryColor,),),
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
                        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(5)),
                        child: OutlinedButton(
                          style: ButtonStyle(
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
                              color: Colors.grey.withOpacity(0.5),
                              width: getScreenWidth(2.5),
                            )),
                          ),
                          onPressed: () {
                            // _selectImage(
                            //     ImagePicker.pickImage(source: ImageSource.gallery), 1);
                          },
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(14, 70, 14, 70),
                            child: Icon(
                              Icons.add,
                              color: appPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(2 )),
                        child: OutlinedButton(
                          style: ButtonStyle(
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
                              color: Colors.grey.withOpacity(0.5),
                              width: getScreenWidth(2.5),
                            )),
                          ),
                          onPressed: () {
                            // _selectImage(
                            //     ImagePicker.pickImage(source: ImageSource.gallery), 2);
                          },
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(14, 70, 14, 70),
                            child: Icon(
                              Icons.add,
                              color: appPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(5)),
                        child: OutlinedButton(
                          style: ButtonStyle(
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
                              color: Colors.grey.withOpacity(0.5),
                              width: getScreenWidth(2.5),
                            )),
                          ),
                          onPressed: () {
                            // _selectImage(
                            //     ImagePicker.pickImage(source: ImageSource.gallery), 3);
                          },
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(14, 70, 14, 70),
                            child: Icon(
                              Icons.add,
                              color: appPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getScreenHeight(20),
                ),
                TextFormField(
                    controller: _productNameField,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    enabledBorder: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(),
                    border: UnderlineInputBorder(),
                      labelStyle: TextStyle(fontSize: 20, color: appPrimaryColor, fontWeight: FontWeight.bold),
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    enabledBorder: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(),
                    border: UnderlineInputBorder(),
                      labelStyle: TextStyle(fontSize: 20, color: appPrimaryColor, fontWeight: FontWeight.bold),
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    enabledBorder: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(),
                    border: UnderlineInputBorder(),
                      labelStyle: TextStyle(fontSize: 20, color: appPrimaryColor, fontWeight: FontWeight.bold),
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    enabledBorder: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(),
                    border: UnderlineInputBorder(),
                      labelStyle: TextStyle(fontSize: 20, color: appPrimaryColor, fontWeight: FontWeight.bold),
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
                    contentPadding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    enabledBorder: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(),
                    // border: UnderlineInputBorder(),
                      labelStyle: TextStyle(fontSize: 20, color: appPrimaryColor, fontWeight: FontWeight.bold),
                      hintStyle: TextStyle(fontSize: 12),
                      labelText: "Nearest Location",
                      hintText: "Location of your product"),
                ),
                SizedBox(
                  height: getScreenHeight(20),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getScreenWidth(50), vertical: getScreenHeight(2)),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Upload",
                      style: TextStyle(
                          fontSize: getScreenWidth(16), color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 34, 141, 52)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(200),),                      
                    ),
                  ),
                ),
              ],
            ),
          ),
          // body: Body(),
        ));
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




  


