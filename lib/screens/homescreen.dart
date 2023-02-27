import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:livez/widgets/elevated_card.dart';
import 'package:weather/weather.dart';



import 'package:http/http.dart' as http;



class homeScreen extends StatefulWidget {
  homeScreen({ Key? key }) : super(key: key);
  @override
  State<homeScreen> createState() => _homeScreenState();
}



class _homeScreenState extends State<homeScreen> {
  String area="";
  String humidity="";
  String temp="";
  String cloud="";
  String weatherDesc="";
  var appid="af46776a7c8725d11413a143845b9014";

  void getlocation() async{
    

    var Latitude = "10.1632° N";
    var Longitude = "76.6413° E";
    
    getData();
  }

  void getData() async{
    var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=9.55&lon=76.52&appid=$appid&units=metric');
    http.Response response = await http.get(url);

    if (response.statusCode == 200){
      setState(() {
        String data=response.body;
        print(data);
      area=jsonDecode(data)['name'];
     
      temp=jsonDecode(data)["main"]["temp"].toString();
      humidity=jsonDecode(data)["main"]["humidity"].toString();
      cloud=jsonDecode(data)["clouds"]["all"].toString();
      weatherDesc=jsonDecode(data)["weather"][0]["description"].toString();
      print(temp);
      });
      

      // print('City = $city');
      // print('Temperature = $temp');
      // print('Description = $condition');

    }}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlocation();
  }
  
  @override
  Widget build(BuildContext context){

    
    
    return Scaffold(
      
      bottomNavigationBar: GNav(
        backgroundColor: Color.fromARGB(255, 220, 223, 223),
        tabBackgroundColor: Colors.blue,
        tabs: 
      [
        GButton(icon: Icons.home,
        text: "Home",),
        GButton(icon: Icons.apps,
        text: "Menu",),
        GButton(icon: Icons.person,
        text: "Account",)
      ]),
      body: SafeArea(
        child: 
      Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20,right: 20,top: 7),
           height: MediaQuery.of(context).size.height * 0.2,
           width: MediaQuery.of(context).size.width * 2,
             // Below is the code for Linear Gradient.
           decoration: const BoxDecoration(
               gradient: LinearGradient(
               colors: [Color.fromARGB(255, 38, 137, 192), Color.fromARGB(255, 33, 153, 253)],
              begin: Alignment.bottomLeft,
               end: Alignment.topRight,
               
          ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(area,style: TextStyle(color: Colors.white,
            fontSize: 20),),
            SizedBox(height: 10,),
            Text(temp,style: TextStyle(color: Colors.white,
            fontSize: 35),),
            SizedBox(height: 8,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Humidity : "+humidity+"%",style: TextStyle(color: Colors.white,
            fontSize: 15),),
            SizedBox(width: 20,),
              Text("Cloud : "+cloud,style: TextStyle(color: Colors.white,
            fontSize: 15),),
            ],),

            SizedBox(height: 8,),

            Text(weatherDesc,style: TextStyle(color: Colors.white,
            fontSize: 15)),

          ],
        ),
      ),
          
          SizedBox(height: 50),

        Column(
          children: [
            Row(
              children: [
                 Container(
                margin: EdgeInsets.only(left: 20,right: 10,top: 7),
               height: MediaQuery.of(context).size.height * 0.2,
               width: MediaQuery.of(context).size.width * 0.4,
                 // Below is the code for Linear Gradient.
               decoration: const BoxDecoration(
                   gradient: LinearGradient(
                   colors: [Color.fromARGB(255, 38, 137, 192), Color.fromARGB(255, 33, 153, 253)],
                  begin: Alignment.bottomLeft,
                   end: Alignment.topRight,
                   
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Center(
              child: Column(
                children: [
                  Column(
                children: [
                  SizedBox(height: 20,),
                  Icon(Icons.water_drop,
                  color: Colors.red,
                  size: 70,
                  ),
                  Text('Blood banks',
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white)
                  )
                    
                ],
              )
                ],
              ),
            )
             ),
             Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 7),
               height: MediaQuery.of(context).size.height * 0.2,
               width: MediaQuery.of(context).size.width * 0.4,
                 // Below is the code for Linear Gradient.
               decoration: const BoxDecoration(
                   gradient: LinearGradient(
                   colors: [Color.fromARGB(255, 38, 137, 192), Color.fromARGB(255, 33, 153, 253)],
                  begin: Alignment.bottomLeft,
                   end: Alignment.topRight,
                   
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Center(
              
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Icon(Icons.h_plus_mobiledata_sharp,
                  color: Colors.red,
                  size: 70,),
                  Text('Hospitals',
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),)
                    
                ],
              ),
            )
             ),
              ],
            ),
             Row(
              children: [
                 Container(
                margin: EdgeInsets.only(left: 20,right: 10,top: 7),
               height: MediaQuery.of(context).size.height * 0.2,
               width: MediaQuery.of(context).size.width * 0.4,
                 // Below is the code for Linear Gradient.
               decoration: const BoxDecoration(
                   gradient: LinearGradient(
                   colors: [Color.fromARGB(255, 38, 137, 192), Color.fromARGB(255, 33, 153, 253)],
                  begin: Alignment.bottomLeft,
                   end: Alignment.topRight,
                   
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Center(
              child: Column(
                children: [
                  Column(
                children: [
                  SizedBox(height: 20,),
                  Icon(Icons.car_repair_outlined,
                  color: Colors.orange,
                  size: 70,
                  ),
                  Text('Gas Stations',
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white)
                  )
                    
                ],
              )
                ],
              ),
            )
             ),
             Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 7),
               height: MediaQuery.of(context).size.height * 0.2,
               width: MediaQuery.of(context).size.width * 0.4,
                 // Below is the code for Linear Gradient.
               decoration: const BoxDecoration(
                   gradient: LinearGradient(
                   colors: [Color.fromARGB(255, 38, 137, 192), Color.fromARGB(255, 33, 153, 253)],
                  begin: Alignment.bottomLeft,
                   end: Alignment.topRight,
                   
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Center(
              
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Icon(Icons.food_bank,
                  color: Colors.amber,
                  size: 70,),
                  Text('Food Stations',
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),)
                    
                ],
              ),
            )
             ),
              ],
            ),
          ],
        )

          

        ],
        
      ),
    
      ),
    );
  }
}