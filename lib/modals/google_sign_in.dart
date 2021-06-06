import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount _user;  // holds the info of user , eg. profile image,name,email

  GoogleSignInAccount get user => _user;

  Future googleLogin() async {   //executed whenever SIGNUP WITH GOOGLE BUTTON is clicked
    try{
      final googleUser=await googleSignIn.signIn();   //shows popup to select an user account

      if(googleUser==null) return;

      _user=googleUser;

      final googleAuth=await googleUser.authentication;

      final credential=GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    }catch(e){
      print(e.toString());
    }
    notifyListeners();

  }

  Future logout() async{
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }


}