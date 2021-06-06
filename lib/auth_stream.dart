
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_signin/screens/logged_in_screen.dart';
import 'package:google_signin/screens/sign_up_screen.dart';

class AuthStream extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else if(snapshot.hasData){
          return LoggedInScreen();
        } else if (snapshot.hasError){
          return Center(child:Text('Something Went Wrong!'));
        }else{
          return SignUpScreen();
        }
      },
    );
  }
}