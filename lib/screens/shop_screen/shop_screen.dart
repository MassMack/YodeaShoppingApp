import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterfbauth/screens/shop_screen/widgets/banners.dart';
import 'package:flutterfbauth/screens/shop_screen/widgets/exclusive_offers.dart';
import '../../constants.dart';
import '../../mq.dart';
import 'widgets/best_selling.dart';

import 'widgets/groceries.dart';
import 'widgets/meats.dart';
import 'widgets/search_field.dart';

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MQuery().init(context);
    
    //print("READ COLLECT = ${_ReadAllCollection("Product")}");

    return SafeArea(
      child: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Column(
            children: [
              //SvgPicture.asset('assets/icons/YODEA small.svg'),

              // SizedBox(height: 5),
              Text(
                'YODEA',
                style: TextStyle(
                    color: kPrimaryColor, fontSize: 50.0, fontFamily: 'Trueno'),
              ),
              SizedBox(height: 10),
              SearchField(),
              SizedBox(height: 10),
              Banners(),
              SizedBox(height: 10),
              _buildSectiontitle('ข้อเสนอพิเศษ', () {}),
              ExclusiveOffers(),
              // SizedBox(height: 10),
              // _buildSectiontitle('Best Sellings', () {}),
              // BestSellings(),
              // SizedBox(height: 10),
              // _buildSectiontitle('Groceries', () {}),
              // Groceries(),
              // SizedBox(height: 10),
              // _buildSectiontitle('Meats', () {}),
              // Meats(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectiontitle(String title, [Function onTap]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: kTitleStyle.copyWith(fontSize: 18),
          ),
          InkWell(
            onTap: onTap ?? () {},
            child: Text(
              'See all',
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

_ReadAllCollection(String NCollect) {
  //var firebaseUser =  FirebaseAuth.instance.currentUser;

  FirebaseFirestore.instance
      .collection("Product")
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      print(doc["banana"]);
    });
  });
}
