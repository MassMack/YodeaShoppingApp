import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfbauth/product.dart';
import 'package:flutterfbauth/services/authservice.dart';
import 'package:flutterfbauth/static%20image/static.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

final firestoreInstance = FirebaseFirestore.instance;
final formKey = GlobalKey<FormState>();
Product product = Product();
int y;
int k = 1;
int sum;
int keepprice;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      //Text('You are logged in'),
      ElevatedButton(
          onPressed: () {
            AuthService().signOut();
          },
          child: Center(child: Text('LOG OUT'))),
      Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                "กรอกชื่อสินค้า",
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                validator: RequiredValidator(errorText: "กรุณาป้อนชื่อ"),
                onSaved: (name) {
                  product.name = name;
                },
              ),
              Text(
                "จำนวน",
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                validator: RequiredValidator(errorText: "กรุณาป้อนจำนวน"),
                onSaved: (count) {
                  product.count = int.parse(count);
                  setState(() {});
                },
              ),
            ],
          )),
      SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            child: Text(
              "ถามราคา",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () async {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();
                print(product.name);
                print(product.count);
                product.price = await _onPressed(product.name);
                product.sum = product.price * product.count;
                print("sum = ${product.sum}");
                print("This is for test github");
                print("This is for test github");
              }

              setState(() {});
            },
          )),

      new Text("${product.sum}"),
      new Text("${product.count}"),

      Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                minWidth: 170,
                child: ElevatedButton(
                  child: Text("ตรวจสอบสินค้า"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StaticImage(),
                      ),
                    );
                  },
                ),
              ),
              //   ButtonTheme(
              //     minWidth: 160,
              //   child: ElevatedButton(
              //    child: Text("Real Time Detection"),
              //     onPressed:() {
              //    Navigator.push(context, MaterialPageRoute(
              //        builder: (context) => LiveFeed(cameras),
              //    ),
              //   );
              //  },
              //  ),
              //  ),
            ],
          ),
        ),
      ),
    ]));
  }
}

_onPressed(product) async {
  //var firebaseUser =  FirebaseAuth.instance.currentUser;
  int x;
  await firestoreInstance.collection("price").doc("TEST").get().then((value) {
    print(value.data());
    print(value.data()[product]);
    x = int.parse(value.data()[product]);

    print("ค่า x 2 ${x}");
    //print("ค่า y 2 ${y}");
    //Fluttertoast.showToast(msg: "${y}", gravity: ToastGravity.CENTER);
  });
  print("ค่า x 3 ${x}");
  return x;
}

Future<String> getUserOrder() {
  return Future.delayed(Duration(seconds: 4), () => 'Large Latte');
}
