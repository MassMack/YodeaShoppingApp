import 'package:flutter/material.dart';
import 'package:flutterfbauth/error_handler.dart';
import 'package:flutterfbauth/services/authservice.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = new GlobalKey<FormState>();

  String email, password;
  Color blueColor = Color(0xFF039BE5);
  

  //To check fields during submit
  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      
      return true;
    }
    return false;
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(key: formKey, child: _buildSignupForm())));
  }

  _buildSignupForm() {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(children: [
          SizedBox(height: 75.0),
          Container(
              height: 125.0,
              width: 200.0,
              child: 
                
                  Text('สมัครสมาชิกใหม่',
                      style: TextStyle(fontFamily: 'Trueno', fontSize: 30.0)),
                  
              ),
          SizedBox(height: 25.0),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'อีเมล',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: blueColor),
                  )),
              onChanged: (value) {
                this.email = value;
              },
              validator: MultiValidator([
              RequiredValidator(errorText: "กรุณาป้อนอีเมล"),
              EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง")
            ]),
              ),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'รหัสผ่าน',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: blueColor),
                  )),
              obscureText: true,
              onChanged: (value) {
                this.password = value;
              },
              validator: RequiredValidator(errorText: "กรุณาป้อนรหัสผ่าน")
              ),
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () {
              if (checkFields())
                AuthService().signUp(email, password).then((userCreds) {
                  Navigator.of(context).pop();
                }).catchError((e) {
                  ErrorHandler().errorDialog(context, e);
                });
            },
            child: Container(
                height: 50.0,
                child: Material(
                    borderRadius: BorderRadius.circular(25.0),
                    shadowColor: Colors.blueAccent,
                    color: blueColor,
                    elevation: 7.0,
                    child: Center(
                        child: Text('สมัครสมาชิก',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Trueno'))))),
          ),
          SizedBox(height: 20.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text('ย้อนกลับ',
                    style: TextStyle(
                        color: blueColor,
                        fontFamily: 'Trueno',
                        decoration: TextDecoration.underline)))
          ])
        ]));
  }
}
