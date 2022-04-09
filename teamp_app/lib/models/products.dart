import 'package:cloud_firestore/cloud_firestore.dart';

class Products{
  late String id;
  late String name;
  late String price;
  late String owner;
  late String description;
  late String location;
  late String phoneNumber;
  late String image;
  //late Timestamp createdAt;

  Products.fromMap(Map<String, dynamic> data){
    id = data['id'];
    name = data['name'];
    price = data['price'];
    owner = data['owner'];
    description = data['description'];
    location = data['location'];
    phoneNumber = data['phoneNumber'];
    image = data['image'];
    //createdAt = data['createdAt'];
  }
}