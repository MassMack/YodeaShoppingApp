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

addCart(int id, counter) {
  print(demoProducts[0].id);
  for (int i = 0; i < demoProducts.length; i++) {
    print("ค่า demoProduct${demoProducts[i].id}");
    print("ค่า id${id}");
    if (demoProducts[i].id == id) {
      print("เท่ากันแล้ว");

      if (demoCarts.length > 0) {
        var checkif = 0;
        for (int j = 0; j < demoCarts.length; j++) {
          print(j);
          print("ตะกร้ามากกว่า 1");
          print("demoCarts.length ${demoCarts.length}");
          print("demoCarts[j].product.id ${demoCarts[j].product.id}");
          print("ค่า id หลัง j ${id}");
          if (demoCarts[j].product.id == id) {
            print("demoCarts[j].product.id == id");
            demoCarts[j] = Cart(
                product: demoProducts[i],
                numOfItem: demoCarts[j].numOfItem + counter);
            checkif = 1;
            break;
          }
        }
        if (checkif != 1) {
          print("demoCarts[j].product.id != id");
          demoCarts.add(Cart(product: demoProducts[i], numOfItem: counter));
          break;
        }
      } else if (demoCarts.length == 0) {
        print("เข้าเคส demoCart.lennth =0");
        demoCarts.add(Cart(product: demoProducts[i], numOfItem: counter));
        break;
      }
    }
  }
  //print(demoProducts.indexOf(demoProducts.id));
  //print(CalculateTotal());
}

CalculateTotal() {
  double total = 0;
  demoCarts.forEach((element) {
    total = total + (element.product.price * element.numOfItem);
  });
  return total;
}
