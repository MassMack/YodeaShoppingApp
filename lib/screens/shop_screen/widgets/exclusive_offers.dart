import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfbauth/models/Cart.dart';
import 'package:flutterfbauth/models/models.dart';

import '../../../mq.dart';
import 'grocery_item.dart';

final List<MGrocery> _items = [
  // MGrocery(
  //   name: "BA",
  //   image: 'assets/images/bananas.png',
  //   description: '7ชิ้น',
  //   price: 20,
  //   id: 4,
  // ),
  // MGrocery(
  //   name: 'Red Apple',
  //   image: 'assets/images/apples.png',
  //   description: '1kg',
  //   price: 25,
  // ),
  // MGrocery(
  //   name: 'Red Pepper',
  //   image: 'assets/images/pepper.png',
  //   description: '1kg',
  //   price: 30,
  // ),
  // MGrocery(
  //   name: 'Red Apple',
  //   image: 'assets/images/apples.png',
  //   description: '1kg',
  //   price: 40,
  // ),
];

class ExclusiveOffers extends StatelessWidget {
  ExclusiveOffers({
    Key key,
  }) : super(key: key);
  var xa;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MQuery.height * 0.3,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemCount: _items.length,
        itemBuilder: (_, i) => GroceryItem(item: _items[i]),
        separatorBuilder: (_, __) => SizedBox(width: 10),
      ),
    );
  }
}

_ReadAllCollection() async {
  //var firebaseUser =  FirebaseAuth.instance.currentUser;
  int x;
  await FirebaseFirestore.instance.collection("Product").get().then((value) {
    print(value);
    //print(value.data()[product]);
    //x = int.parse(value.data()[product]);
  }).catchError((e) {});

  return x;
}

void ReadProductForExcluesive_offer() {
  // var firebaseUser = FirebaseAuth.instance.currentUser;
  // print("firebaseUser");
  // print(firebaseUser);
  FirebaseFirestore.instance.collection("Product").get().then((querySnapshot) {
    //xa = querySnapshot.docs;
    querySnapshot.docs.forEach((result) {
      // print(result.data()['image']);
      // print(result.data());
      // print(result.data()['name'].runtimeType);
      // xa.add(result.data());

      _items.add(MGrocery(
        name: result.data()['name'],
        image: result.data()['image'],
        description: result.data()['description'],
        price: double.parse(result.data()['price']),
        id: result.data()['id'],
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
  //print("ค่า${_items}");
}
