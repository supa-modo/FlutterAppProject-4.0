import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../sizeConfig.dart';
import 'components/body.dart';

class ImageViewScreen extends StatelessWidget {
  static String routeName = "/imageViewScreen";
  const ImageViewScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Your Product"),
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: appPrimaryColor),
        onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: const <Widget>[
                  AddImage(),
                  AddImage(),
                  AddImage(),
                  ],
              )
            ],
          ),
        ),
      ),
      // body: Body(),
    );
  }
}

class AddImage extends StatelessWidget {
  const AddImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: Colors.grey.withOpacity(0.5), width: getScreenWidth(2.5),)),
          ),
          onPressed: () {}, 
          child: const Padding(
            padding: EdgeInsets.fromLTRB(14, 70, 14, 70),
            child: Icon(Icons.add, color: Colors.grey,),
            ),
          ),
        ),
      );
  }
}