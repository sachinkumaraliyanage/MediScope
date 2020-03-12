
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Ui/SplashScreenHome.dart';
import 'Ui/SplashScreenLogin.dart';
import 'Utill/FirebaseData.dart';
import 'Utill/locator.dart';
import 'Ui/ImageCapture.dart';

//sachin kumara Liyanage
//IT17152938
void main(){
  setupLocator();
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'CTSE Final Progect',
    home:MainContoller(),
//  home:ImageCapture(),
  ),
  );
}

class MainContoller extends StatelessWidget{
  static bool i=true;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context,AsyncSnapshot<FirebaseUser> snapshot){

//
        if(snapshot.connectionState==ConnectionState.waiting){

            return SplashScreenLogin();
        }
        if(!snapshot.hasData || snapshot.data==null){

          return SplashScreenLogin();

        }
        FirebaseDataApi.useremail=snapshot.data.email;

        return SplashScreenHome();

      },
    );
  }

}




