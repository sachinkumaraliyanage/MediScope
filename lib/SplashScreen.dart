import 'package:flutter/material.dart';
import 'FullBackground.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        fit:StackFit.expand,
        children: <Widget>[
          new FullBackground('assets/backimg/spback3.jpg', 3.0, 3.0, 0.2),
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