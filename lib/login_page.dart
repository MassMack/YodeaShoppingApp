import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterfbauth/reset.dart';
import 'package:flutterfbauth/services/authservice.dart';
import 'package:flutterfbauth/signup.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String email, password;
  Color blueColor = Color(0xFF039BE5);
  
  final Widget logoyodeasvg = SvgPicture.asset(
    "assets/logo.svg",
    semanticsLabel: 'Logo',
  );
  //To check fields during submit
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(key: formKey, child: _buildLoginForm())));
  }

  //To Validate email
  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

 

  _buildLoginForm() {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(children: [
          
          Container(
            height: 100.0,
            width: 200.0,
            child: logoyodeasvg,
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
          SizedBox(height: 5.0),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ResetPassword()));
              },
              child: Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(top: 15.0, left: 20.0),
                  child: InkWell(
                      child: Text('ลืมรหัสผ่าน',
                          style: TextStyle(
                              color: blueColor,
                              fontFamily: 'Trueno',
                              fontSize: 11.0,
                              decoration: TextDecoration.underline))))),
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () {
              if (checkFields()) AuthService().signIn(email, password, context);
            },
            child: Container(
                height: 50.0,
                child: Material(
                    borderRadius: BorderRadius.circular(25.0),
                    shadowColor: Colors.blueAccent,
                    color: blueColor,
                    elevation: 7.0,
                    child: Center(
                        child: Text('เข้าสู่ระบบ',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Trueno'))))),
          ),
          SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {
              AuthService().fbSignIn();
            },
            child: Container(
                height: 50.0,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.0),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: ImageIcon(AssetImage('assets/facebook.png'),
                              size: 15.0)),
                      SizedBox(width: 10.0),
                      Center(
                          child: Text('เข้าสู่ระบบด้วย Facebook',
                              style: TextStyle(fontFamily: 'Trueno'))),
                    ],
                  ),
                )),
          ),
          SizedBox(height: 25.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignupPage()));
                },
                child: Text('สมัครสมาชิกใหม่',
                    style: TextStyle(
                        color: blueColor,
                        fontFamily: 'Trueno',
                        decoration: TextDecoration.underline)))
          ])
        ]));
  }
}
