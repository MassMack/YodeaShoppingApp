import 'package:flutter/material.dart';
import 'package:flutterfbauth/models/Cart.dart';
import 'package:flutterfbauth/screens/cart_screen/cart_screen.dart';
import 'package:flutterfbauth/screens/detect_screen/detect_screen.dart';

import 'package:flutterfbauth/screens/shop_screen/shop_screen.dart';
import 'package:flutterfbauth/services/authservice.dart';


import 'widgets/nav_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final List _tabIcons = List.unmodifiable([
    {'icon': 'assets/icons/shop.svg', 'title': 'หน้าแรก'},
    
    {'icon': 'assets/icons/cart.svg', 'title': 'ตะกร้า'},
    {'icon': 'assets/icons/scan.svg', 'title': 'จ่ายเงิน'},
    //{'icon': 'assets/icons/favorite.svg', 'title': 'Favorites'},
    {'icon': 'assets/icons/account.svg', 'title': 'บัญชีผู้ใช้'},
     
  ]);

  final List<Widget> _tabs = List.unmodifiable([
    ShopScreen(),
    CartScreen(),
    DetectScreen(),
    Container(
      
      child: ElevatedButton(
          onPressed: () {
            AuthService().signOut();
          },
          child: Center(child: Text('LOG OUT'))),
    ),
    Container(
     
    ),
   
    
  ]);

  void onTabChanged(int index) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    print("TEST1");
    print(currentIndex);
    
    return Scaffold(
      body: _tabs[currentIndex],
      bottomNavigationBar: 
      
      NavBar(
        tabIcons: _tabIcons,
        activeIndex: currentIndex,
        onTabChanged: onTabChanged,
      ),
    );
    
  }
}
