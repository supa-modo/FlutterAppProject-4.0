import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/products.dart';
import '../notifier/notifier.dart';

getProducts(ProductsNotifier productsNotifier) async {
  QuerySnapshot querysnapshot =
      await FirebaseFirestore.instance.collection('Products').get();

  List<Products> _productsList = [];

  querysnapshot.docs.forEach((doc) {
    var snapData = doc.data();
    Products products = Products.fromMap(snapData as Map<String, dynamic>);
    _productsList.add(products);
  });

  productsNotifier.productsList = _productsList;
}

uploadProductsAndImage(Products products, File localFile) async {
  if (localFile != null) {
    print('Uploading image');

    var fileExtension = path.extension(localFile.path);
    print(fileExtension);
    var uuid = Uuid().v4();

    final Reference storageRef = FirebaseStorage.instance
        .ref()
        .child('products/images/$uuid$fileExtension');

    await storageRef.putFile(localFile);

    String url = await storageRef.getDownloadURL();
    print("downloadUrl: $url");
    _uploadProducts(products, imageUrl: url);
  } else {
    print("Skipping product image upload");
  }
}

_uploadProducts(Products products, {String? imageUrl}) async {
  CollectionReference productsRef =
      FirebaseFirestore.instance.collection('Products');

  if (imageUrl != null) {
    products.image = imageUrl;
  }

  DocumentReference documentRef = await productsRef.add(products.toMap());
  // products.id = documentRef.id;

  print("Uploaded product successfully: ${products.toString()}");
  await documentRef.set(products.toMap(), SetOptions(merge: true));
}
