import 'dart:async';
import 'package:flutter/material.dart';
import 'FullBackground.dart';
import 'LoginPage.dart';
import 'test.dart';

//sachin kumara Liyanage
//IT17152938
class SplashScreenHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenHome>{
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), ()=>{
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => new test()),
      ),
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        fit:StackFit.expand,
        children: <Widget>[
          new FullBackground('assets/backimg/spback3.jpg', 6.0, 6.0, 0.2),
          new Expanded(
            flex: 2,
            child:new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Center(
                  child:new Image.asset('assets/icons/icon.png',width: 300.0,),
                ),
                Container(
                  width: 70,
                  height: 70,
                  child:CircularProgressIndicator(backgroundColor: Colors.green,strokeWidth: 8,valueColor:AlwaysStoppedAnimation<Color>(Colors.lime),),
                ),

                Padding(padding: EdgeInsets.only(top:20),),

              ],
            ),
          ),


        ],

      )
    );
  }

}