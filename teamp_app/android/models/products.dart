import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final double price;

  Product({
    required this.id,
    required this.images,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/tomato.jpg"
    ],
    
    title: "Fresh Tomatoes",
    price: 400.00,
    description: description,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/onions.jpeg",
    ],
    
    title: "Fresh Onions",
    price: 100.00,
    description: description,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/Corn.webp",
    ],
    
    title: "Maize",
    price: 36.55,
    description: description,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/Watermelons.jpg",
    ],
    
    title: "Watermelons",
    price: 20.20,
    description: description,
  ),
];

const String description =
    "Fresh ripe produce harvested directly from the farm";
