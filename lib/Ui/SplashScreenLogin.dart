/*
* File Name: SplashScreenLogin.dart
* Author: P.M.C.P.Paththinisekara
* Reg No: IT17056212
* Date: 2020/03/20
* Description: Contains interface design for the splash screen which will redirect the user to login page if he is not logged in.
* */


import 'dart:async';
import 'package:flutter/material.dart';
import 'FullBackground.dart';
import 'LoginPage.dart';


class SplashScreenLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenLogin> {
  //redirect interface after 2 sec
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => new LoginPage()),
              ),
            });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new FullBackground('assets/backimg/spback3.jpg', 6.0, 6.0, 0.2),
            new Expanded(
              flex: 2,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Center(
                    child: new Image.asset(
                      'assets/icons/icon.png',
                      width: 300.0,
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.green,
                      strokeWidth: 8,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.lime),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
