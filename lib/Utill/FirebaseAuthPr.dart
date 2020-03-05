import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
class FirebaseAuthPr{
   final FirebaseAuth _auth= FirebaseAuth.instance;

   Future<void> logout() async {
      try{
         await _auth.signOut();
      }catch(e){
         print(e);
      }

   }

   Future<bool> loginwithgoogle() async {
      try{
         GoogleSignIn googleSignIn=GoogleSignIn();
         GoogleSignInAccount account= await googleSignIn.signIn();
         if(account==null){
            return false;
         }
         
         AuthResult res=await _auth.signInWithCredential(GoogleAuthProvider.getCredential(
             idToken: (await account.authentication).idToken,
             accessToken: (await account.authentication).accessToken
         ));
         if(res.user==null){
            return false;
         }

         return true;

      }catch(e){
         print(e);
      }

   }

   Future<bool> loginwithfacebook() async {
      try{
         FacebookLogin facebookLogin =new FacebookLogin();
         var re= await facebookLogin.logIn(['email','public_profile']);
         if(re.status==FacebookLoginStatus.loggedIn){
            AuthResult res=  await _auth.signInWithCredential(FacebookAuthProvider.getCredential(
               accessToken: re.accessToken.token
            ));

            if(res.user==null){
               return false;
            }

            return true;

         }else{
            print(re.status.toString());
            return false;
         }
      }catch(e){
         print(e);
         return false;
      }
   }
}