/*
* File Name: FirebaseAuthPr.dart
* Author: P.M.C.P.Paththinisekara
* Reg No: IT17056212
* Date: 2020/03/20
* Description: Contains implementation of Firebase authentication using flutter_facebook_login and google_sign_in libraries.
* */


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'FirebaseData.dart';


class FirebaseAuthPr {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //log out from app
  Future<void> logout() async {
    try {
      await _auth.signOut();
      FirebaseDataApi.useremail = "";
    } catch (e) {
      print(e);
    }
  }

  //login using google auth
  Future<bool> loginwithgoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount account = await googleSignIn.signIn();
      if (account == null) {
        return false;
      }

      AuthResult res = await _auth.signInWithCredential(
          GoogleAuthProvider.getCredential(
              idToken: (await account.authentication).idToken,
              accessToken: (await account.authentication).accessToken));
      if (res.user == null) {
        return false;
      }
      FirebaseDataApi.useremail = res.user.email;
      return true;
    } catch (e) {
      print(e);
    }
  }

  //login using facebook auth
  Future<bool> loginwithfacebook() async {
    try {
      FacebookLogin facebookLogin = new FacebookLogin();

      var re = await facebookLogin.logIn(['email', 'public_profile']);

      if (re.status == FacebookLoginStatus.loggedIn) {
        AuthResult res = await _auth.signInWithCredential(
            FacebookAuthProvider.getCredential(
                accessToken: re.accessToken.token));

        if (res.user == null) {
          return false;
        }
        FirebaseDataApi.useremail = res.user.email;
        return true;
      } else {
        print(re.errorMessage);
        print(re.status.toString());
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
