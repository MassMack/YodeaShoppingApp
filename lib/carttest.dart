import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class Cart extends StatefulWidget {
  final Map<String, int> itemCount;
  //Cart(this.itemCount, {String text});
  //final String text;
  @override
  Cart({this.itemCount});
  _CartState createState() => _CartState(itemCount);
}

class _CartState extends State<Cart> {
  @override
  _CartState(Map<String, int> itemCount) {
    print(itemCount);
    itemCount.forEach((name, count) async{
      print("คำนวณราคา = ${await calPrice(name, count)}");
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ใส่เงินเข้ามานะครับคนดี"),
        ),
        body: Container());
  }
}

calPrice(name, count) async {
  int x;
  int total;
  await firestoreInstance.collection("price").doc("TEST").get().then((value) {
    print(value.data());
    print(value.data()[name]);
    x = int.parse(value.data()[name]);
    total = x * count;
  });

  return total;
}
