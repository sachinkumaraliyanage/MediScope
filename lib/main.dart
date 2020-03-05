
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Ui/SplashScreen.dart';
import 'Ui/SplashScreenHome.dart';
import 'Ui/SplashScreenLogin.dart';

//sachin kumara Liyanage
//IT17152938
void main() => runApp( MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'CTSE Final Progect',
  home:MainContoller(),
//  home:LoginPage(),
),
);

class MainContoller extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context,AsyncSnapshot<FirebaseUser> snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return SplashScreen();
        }
        if(!snapshot.hasData || snapshot.data==null){
          return SplashScreenLogin();
        }

        return SplashScreenHome();
      },
    );
  }

}

