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

  Products();

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

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'price': price,
      'owner': owner,
      'description': description,
      'location': location,
      'phoneNumber': phoneNumber,
      'image': image,
    };
  }
}