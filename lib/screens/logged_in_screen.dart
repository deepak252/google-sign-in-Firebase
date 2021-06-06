import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_signin/modals/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoggedInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user= FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Logged In'),
        actions: <Widget>[
          TextButton(
            child:Text('Logout'),
            onPressed: (){
              final provider= Provider.of<GoogleSignInProvider>(context,listen: false);
              provider.logout();
            },
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('PROFILE'),
              const SizedBox(height:30),
              CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL),
                radius: 40,
              ),
              const SizedBox(height:30),
              Text(
                'Name: ${user.displayName}',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height:10),
              Text(
                'Email: ${user.email}',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height:30),
            ],
          ),
        ),
      ),
    );
  }
}