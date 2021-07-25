import 'package:flutter/material.dart';
import 'package:flutterfbauth/carttest.dart';
import 'package:flutterfbauth/models/Product.dart';
import 'package:flutterfbauth/models/models.dart';
import 'package:flutterfbauth/widgets/round_button.dart';
import 'package:flutterfbauth/models/Cart.dart';

import '../../constants.dart';
import 'widgets/details.dart';
import 'widgets/expandable.dart';
import 'widgets/header.dart';

class ItemDetailsSreen extends StatelessWidget {
  static const routeName = 'item-details-screen/';
  final MGrocery item;

  const ItemDetailsSreen({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(item: item),
              Details(item: item),
              SizedBox(height: 15),
              Divider(color: kBorderColor),
              Expandable(title: 'Product Details'),
              Divider(color: kBorderColor, indent: 15, endIndent: 15),
              Expandable(
                title: 'Nutrition',
                trailing: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kSecondaryColor,
                  ),
                  child: Text('100gr'),
                ),
              ),
              Divider(color: kBorderColor, indent: 15, endIndent: 15),
              Expandable(
                title: 'Reviews',
                trailing: Row(
                  children: List.generate(
                      8,
                      (index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          )),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RoundButton(
                    title: 'เพิ่มลงตะกร้า',
                    onTap: () {
                      print("item.id= ${item.id}");
                      addCart(item.id);
                      
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
