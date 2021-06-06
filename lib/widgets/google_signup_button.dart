import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_signin/modals/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleSignUpButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: FaIcon(FontAwesomeIcons.google,color: Colors.red,),
      label: Text('Sign up with google',style: TextStyle(fontSize: 16),),
      style:ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity,54),
        primary: Colors.white,
        onPrimary: Colors.black.withOpacity(0.9),
      ),
      onPressed: (){
        final provider=Provider.of<GoogleSignInProvider>(context,listen: false);
        provider.googleLogin();
      },
    );
  }
}