/*
* File Name: main.dart
* Author: P.M.C.P.Paththinisekara/S.K.Liyanage
* Reg No: IT17056212/IT17152938
* Date: 2020/03/20
* Description: Contains main function code
* */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Ui/SplashScreenHome.dart';
import 'Ui/SplashScreenLogin.dart';
import 'Utill/FirebaseData.dart';
import 'Utill/locator.dart';
import 'Ui/ImageCapture.dart';

void main() {
  setupLocator();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CTSE Final Progect',
      home: MainContoller(),
//  home:ImageCapture(),
    ),
  );
}
// open relevant interface
class MainContoller extends StatelessWidget {
  static bool i = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
//
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreenLogin();
        }
        if (!snapshot.hasData || snapshot.data == null) {
          return SplashScreenLogin();
        }
        FirebaseDataApi.useremail = snapshot.data.email;

        return SplashScreenHome();
      },
    );
  }
}
