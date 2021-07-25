import 'package:flutter/material.dart';

import 'Product.dart';

class Cart {
  final Product product;
  final int numOfItem;

  Cart({@required this.product, @required this.numOfItem});
}

// Demo data for our cart

List<Cart> demoCarts = [
  //Cart(product: demoProducts[1], numOfItem: 1)
];

addCart(int id) {
  print(demoProducts[0].id);
  for (int i = 0; i < demoProducts.length; i++) {
    print("ค่า demoProduct${demoProducts[i].id}");
    print("ค่า id${id}");
    if (demoProducts[i].id == id) {
      print("เท่ากันแล้ว");
      demoCarts.add(Cart(product: demoProducts[i], numOfItem: 1));
      break;
    }
  }
  //print(demoProducts.indexOf(demoProducts.id));
}
