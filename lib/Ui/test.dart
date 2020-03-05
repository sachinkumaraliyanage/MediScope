import 'package:flutter/material.dart';
import '../Utill/FirebaseAuthPr.dart';
import '../main.dart';

class test extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child:  new RaisedButton(
          onPressed: () async {
            await FirebaseAuthPr().logout();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => new MainContoller()),
              );

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
        )
        ,),
    );
  }

}