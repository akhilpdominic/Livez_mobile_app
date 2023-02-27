import 'package:flutter/material.dart';
import 'package:livez/provider/signin.dart';
import 'package:provider/provider.dart';

class login extends StatefulWidget {
  const login({ Key? key }) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                child: OutlinedButton(
                onPressed: ()
                {
                  final provider=Provider.of<GoogleSignInProvider>(context,listen: false);
                  provider.googleLogin();
                },
                
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(350,60),
                  shape: StadiumBorder(),
                  backgroundColor: Colors.blue[400],
                ),
                child: const Text("Sign up with google",style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),),
        ),
              ),
            ],
          ),)),
    );
  }
}