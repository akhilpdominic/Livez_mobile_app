import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livez/screens/homescreen.dart';

class logopage extends StatefulWidget {
  const logopage({ Key? key }) : super(key: key);

  @override
  State<logopage> createState() => _logopageState();
}

class _logopageState extends State<logopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Column(
        children: [
          SizedBox(height: 60,),
          Image(image: AssetImage('assets/images/logo.jpg'),),
          SizedBox(
            height: 40,
          ),
          OutlinedButton(
          onPressed: ()
          {
            Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
          },
          
          style: OutlinedButton.styleFrom(
            minimumSize: Size(350,60),
            shape: StadiumBorder(),
            backgroundColor: Colors.blue[400],
          ),
          child: const Text("Get Started",style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),),
        )
        ],
      )),
      
    );
  }
}