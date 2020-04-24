/*
* File Name: LoginPage.dart
* Author: P.M.C.P.Paththinisekara
* Reg No: IT17056212
* Date: 2020/03/20
* Description: Contains interface design for the login functionality.
* */

import 'package:flutter/material.dart';
import 'FullBackground.dart';
import '../Utill/FirebaseAuthPr.dart';
import 'ShowList.dart';
import '../main.dart';

class LoginPage extends StatelessWidget {
  final double _opacity = 0.7;//set button opacity

  @override
  Widget build(BuildContext context) {
//    Navigator.removeRoute(context, MaterialPageRoute(builder: (context) =>  SplashScreen()));
    return Scaffold(
//      appBar: AppBar(
//        title: Text('sachin'),
//      ),
        body: new Stack(
      children: <Widget>[
        new FullBackground('assets/backimg/backlogin.jpg', 3.0, 3.0, 0.5),
        new Center(
            child: new SingleChildScrollView(
                child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/icons/icon.png',
                width: 150,
              ),
              new Text(
                'Medi Scope',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white),
              ),
              Divider(
                color: Colors.white.withOpacity(_opacity),
                thickness: 3.0,
                height: 20.0,
                indent: 150.0,
                endIndent: 150.0,
              ),
              new Text(
                'Store Your Medicine Details',
                style: TextStyle(
                    color: Colors.white.withOpacity(_opacity), fontSize: 20),
              ),
              new Container(
                height: 75.0,
              ),
              new SizedBox(
                width: 300.0,
                height: 55.0,
                child: new RaisedButton(
                  splashColor: Colors.green,
                  onPressed: () async {
                    MainContoller.i = true;
                    bool res = await FirebaseAuthPr().loginwithgoogle();
                    if (!res) {
                      print('login fail');
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => new ShowList()),
                      );
                    }
                  },
                  color: Colors.white,
                  shape: StadiumBorder(),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/go.png',
                        width: 40,
                      ),
                      Text(
                        "   Login With Google",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new Row(
                children: <Widget>[
                  new Expanded(
                      child: new Divider(
                    color: Colors.white.withOpacity(_opacity),
                    thickness: 1.0,
                    height: 50.0,
                    indent: 90.0,
//                        endIndent: 150.0,
                  )),
                  new Text(
                    ' OR ',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white.withOpacity(_opacity),
                    ),
                  ),
                  new Expanded(
                      child: new Divider(
                    color: Colors.white.withOpacity(_opacity),
                    thickness: 1.0,
                    height: 20.0,
//                            indent: 150.0,
                    endIndent: 90.0,
                  )),
                ],
              ),
              new SizedBox(
                width: 300.0,
                height: 55.0,
                child: new RaisedButton(
                  splashColor: Colors.green,
                  onPressed: () async {
                    MainContoller.i = true;
                    bool res = await FirebaseAuthPr().loginwithfacebook();
                    if (!res) {
                      print('login fail');
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => new ShowList()),
                      );
                    }
                  },
                  color: Color.fromARGB(1000, 85, 78, 216),
                  shape: StadiumBorder(),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/fb.png',
                        width: 40,
                      ),
                      Text(
                        "   Login With Facebook",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new Container(
                height: 10,
              ),
            ],
          ),
        )))
      ],
    ));
  }
}
