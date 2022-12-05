import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:teamp_app/net/api_methods.dart';

import '../../constants.dart';
import '../../models/products.dart';
import '../../notifier/notifier.dart';
import '../../sizeConfig.dart';
import '../homeScreen/homeScreen.dart';

class ImageViewScreen extends StatefulWidget {
  static String routeName = "/imageViewScreen";
  const ImageViewScreen({Key? key}) : super(key: key);

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Products? _currentProducts;
  String? _imageUrl;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    ProductsNotifier productsNotifier =
        Provider.of<ProductsNotifier>(context, listen: false);

    if (productsNotifier.currentProducts != null) {
      _currentProducts = productsNotifier.currentProducts;
    } else {
      _currentProducts = Products();
    }

    _imageUrl = productsNotifier.currentProducts?.image;
  }

  final imagePicker = ImagePicker();

  Future imagePickerMethod() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        _imageFile = File(pick.path);
      } else {
        showSnackBar("No file selected", Duration(seconds: 5));
      }
    });
  }

  showSnackBar(String snackBarText, Duration d) {
    final snackBar = SnackBar(
      content: Text(
        snackBarText,
        selectionColor: Colors.grey,
        textAlign: TextAlign.center,
      ),
      duration: d,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Color.fromARGB(137, 61, 61, 61),
      width: getScreenWidth(250),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  saveProduct() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    uploadProductsAndImage(_currentProducts!, _imageFile!);
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
          autovalidateMode: AutovalidateMode.always,
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
                                  child: _imageFile == null
                                      ? Center(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: getScreenHeight(5)),
                                                child: Text(
                                                  "Choose image to upload",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 128, 125, 125)),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: getScreenHeight(50)),
                                              OutlinedButton(
                                                style: ButtonStyle(
                                                  side: MaterialStateProperty
                                                      .all<BorderSide>(
                                                          BorderSide(
                                                    color: Color.fromARGB(
                                                            255, 235, 231, 231)
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
                                          ),
                                        )
                                      : Image.file(_imageFile!,
                                          fit: BoxFit.cover),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getScreenHeight(15),
                ),
                TextFormField(
                    onSaved: (value) {
                      _currentProducts!.name = value!;
                    },
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'Product name cannot be empty';
                      }
                      return null;
                    }),
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
                    )),
                SizedBox(
                  height: getScreenHeight(15),
                ),
                TextFormField(
                    onSaved: (value) {
                      _currentProducts!.owner = value!;
                    },
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'Product name cannot be empty';
                      }
                      return null;
                    }),
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
                      labelText: "Your Name",
                    )),
                SizedBox(
                  height: getScreenHeight(15),
                ),
                TextFormField(
                  onSaved: (value) {
                    _currentProducts!.description = value!;
                  },
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Product name cannot be empty';
                    }
                    return null;
                  }),
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
                  ),
                ),
                SizedBox(
                  height: getScreenHeight(15),
                ),
                TextFormField(
                  onSaved: (value) {
                    _currentProducts!.price = value!;
                  },
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Price cannot be empty';
                    }
                    return null;
                  }),
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
                  ),
                ),
                SizedBox(
                  height: getScreenHeight(15),
                ),
                TextFormField(
                  onSaved: (value) {
                    _currentProducts!.phoneNumber = value!;
                  },
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Phone number cannot be empty';
                    }
                    if (value.length < 10) {
                      return 'Enter a valid phone number';
                    }
                    return null;
                  }),
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
                  ),
                ),
                SizedBox(
                  height: getScreenHeight(15),
                ),
                TextFormField(
                  onSaved: (value) {
                    _currentProducts!.location = value!;
                  },
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.streetAddress,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Nearest location cannot be empty';
                    }
                    return null;
                  }),
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
                    labelText: "Nearest Location",
                  ),
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
                        saveProduct();
                        showSnackBar("Product Uploaded Succesfully",
                            Duration(seconds: 5));
                        Navigator.pushNamed(context, HomeScreen.routeName);
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
}
