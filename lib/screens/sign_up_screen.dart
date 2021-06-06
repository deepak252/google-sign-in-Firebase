import 'package:flutter/material.dart';
import 'package:google_signin/widgets/google_signup_button.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200].withOpacity(0.8),
      // appBar: AppBar(
      //   title: Text('Sign in'),
      // ),
      body: Container(
        padding: EdgeInsets.all(26),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Text(
                'logo in',
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                  fontFamily: 'Gabriola',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 44,),
              GoogleSignUpButton(),              
              const SizedBox(height: 44,),
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  children: [
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                  style: TextStyle(
                    fontSize: 16.0,
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



