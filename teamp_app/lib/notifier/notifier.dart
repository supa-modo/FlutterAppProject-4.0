
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:teamp_app/models/products.dart';

class ProductsNotifier with ChangeNotifier{
  List<Products> _productsList = [];
  Products? _currentProducts;

  UnmodifiableListView<Products> get productsList => UnmodifiableListView(_productsList);

  Products? get currentProducts => _currentProducts;

  set productsList(List<Products> productsList){
    _productsList = productsList;
    notifyListeners();
  }

  set currentProducts(Products? products){
    _currentProducts = products;
    notifyListeners();
  }

}