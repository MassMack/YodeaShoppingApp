import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name, description;
  //final List<String> image;
  final String image;
  // /*final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    @required this.id,
    @required this.image,
    // @required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.name,
    @required this.price,
    @required this.description,
  });
}

// Our demo Products
//สมมตินี้คือฐานข้อมูล ที่ไม่ดึงจาก firebase
List<Product> demoProducts = [
  // Product(
  //   id: 1,
  //   image: [
  //     "assets/images/ps4_console_white_2.png",
  //     "assets/images/ps4_console_white_1.png",
  //     "assets/images/ps4_console_white_3.png",
  //     "assets/images/ps4_console_white_4.png",
  //   ],
  //   /*colors: [
  //     Color(0xFFF6625E),
  //     Color(0xFF836DB8),
  //     Color(0xFFDECB9C),
  //     Colors.white,
  //   ],*/
  //   name: "Wireless Controller for PS4™",
  //   price: 64.99,
  //   description: description,
  //   rating: 4.8,
  //   isFavourite: true,
  //   isPopular: true,
  // ),
  // Product(
  //   id: 2,
  //   image: [
  //     "assets/images/Image Popular Product 2.png",
  //   ],
  //   /*colors: [
  //     Color(0xFFF6625E),
  //     Color(0xFF836DB8),
  //     Color(0xFFDECB9C),
  //     Colors.white,
  //   ],*/
  //   name: "Nike Sport White - Man Pant",
  //   price: 50.5,
  //   description: description,
  //   rating: 4.1,
  //   isPopular: true,
  // ),
  // Product(
  //   id: 3,
  //   image: [
  //     "assets/images/glap.png",
  //   ],
  //   /*colors: [
  //     Color(0xFFF6625E),
  //     Color(0xFF836DB8),
  //     Color(0xFFDECB9C),
  //     Colors.white,
  //   ],*/
  //   name: "Gloves XC Omega - Polygon",
  //   price: 36.55,
  //   description: description,
  //   rating: 4.1,
  //   isFavourite: true,
  //   isPopular: true,
  // ),
  // Product(
  //   id: 4,
  //   image: [
  //     "assets/images/wireless headset.png",
  //   ],
  //   /*colors: [
  //     Color(0xFFF6625E),
  //     Color(0xFF836DB8),
  //     Color(0xFFDECB9C),
  //     Colors.white,
  //   ],*/
  //   name: "Logitech Head",
  //   price: 20.20,
  //   description: description,
  //   rating: 4.1,
  //   isFavourite: true,
  // ),
  // Product(
  //   id: 1,
  //   image: [
  //     "assets/images/bananas.png",
  //   ],
  //   /*colors: [
  //     Color(0xFFF6625E),
  //     Color(0xFF836DB8),
  //     Color(0xFFDECB9C),
  //     Colors.white,
  //   ],*/
  //   name: "Organic Bananas",
  //   price: 20,
  //   description: "7pcs",
  //   rating: 4.1,
  //   isFavourite: true,
  // ),
];

// const String description =
//     "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
void ReadProductForProduct() async{
  // demoProducts.add(Product(
  //   name: 'Saku',
  //   image: ['assets/images/apples.png'],
  //   description: 'des',
  //   price: 20,
  //   id: 2,
  // ));
  // var firebaseUser = FirebaseAuth.instance.currentUser;
  // print("firebaseUser");
  // print(firebaseUser);
  await FirebaseFirestore.instance.collection("Product").get().then((querySnapshot) {
    //xa = querySnapshot.docs;
    querySnapshot.docs.forEach((result) {
      // print(result.data()['image']);
      // print(result.data());
      // print(result.data()['name'].runtimeType);
      print(result.data()['name']);
      // xa.add(result.data());

      demoProducts.add(Product(
        name: result.data()['name'],
        image: result.data()['image'],
        description: result.data()['description'],
        price: double.parse(result.data()['price']), 
        id: result.data()['id'],
        // id: 5,
      ));
    });
  });

  // _items.add(MGrocery(
  //   name: "ซากุ๊",
  //   image: 'assets/images/apples.png',
  //   description: '7cc',
  //   price: 40,
  //   id: 5,
  // ));
  // print(xa.runtimeType);
  print("ค่า demo${demoProducts}");
}
