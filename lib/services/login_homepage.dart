import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:livez/screens/login.dart';
import 'package:livez/screens/logopage.dart';

import '../screens/homescreen.dart';

class loginHomepage extends StatelessWidget {
  const loginHomepage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder
      (
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot)
        {
          if(snapshot.connectionState==ConnectionState.waiting)
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(snapshot.hasData)
          {
            return homeScreen();
          }
          else if(snapshot.hasError)
          {
            return Center(child: Text("Something went wrong"),);
          }
          
           else
           return logopage();

        },
      ),
      
    );
  }
}