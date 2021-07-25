import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfbauth/static%20image/static.dart';

class DetectScreen extends StatefulWidget {
  const DetectScreen({ key }) : super(key: key);

  @override
  _DetectScreenState createState() => _DetectScreenState();
}

class _DetectScreenState extends State<DetectScreen> {
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
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
      );
  }
}