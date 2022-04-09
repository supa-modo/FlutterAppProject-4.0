
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/products.dart';
import '../notifier/notifier.dart';

getProducts(ProductsNotifier productsNotifier) async{
  QuerySnapshot querysnapshot = await FirebaseFirestore.instance.collection('Products').get();

  List<Products> _productsList = [];

  querysnapshot.docs.forEach((doc) { 
    var snapData = doc.data();
    Products products = Products.fromMap(snapData as Map<String, dynamic>);
    _productsList.add(products);
  });

  productsNotifier.productsList = _productsList; 

}