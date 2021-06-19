
import 'package:flutter/material.dart';

class TextFieldEx extends StatefulWidget {
  @override
  _TextFieldExState createState() => new _TextFieldExState();
}

class _TextFieldExState extends State<TextFieldEx> {
  TextEditingController _c ;
  double _metal = 0.0;
  double _total = 0.0;
  String _text = "initial";
  @override
  void initState() {
      _c = new TextEditingController();
      super.initState();
    }

  @override
  void dispose(){
   _c?.dispose();
   super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              keyboardType: TextInputType.number,
              onChanged: (v)=>setState((){_text=v;}),
              controller: _c,
            ),
            new RaisedButton(
              child: new Text("Update"),
              onPressed: (){
                setState((){
                  _metal = double.parse(_c.text);
                  _total = _metal+0.025;
                  _c.text = "";
                });
              },
            ),
            new Text("Text Input: $_text"),
            new Text("Metal :$_metal"),
            new Text("Total:$_total")
          ],
        )
      )
    );
  }
}