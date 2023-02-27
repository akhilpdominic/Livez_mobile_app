import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:livez/provider/signin.dart';
import 'package:livez/screens/homescreen.dart';
import 'package:livez/screens/hospitals.dart';
import 'package:livez/screens/login.dart';
import 'package:livez/screens/logopage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:livez/screens/news.dart';
import 'package:livez/services/login_homepage.dart';
import 'package:provider/provider.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> stops=FirebaseFirestore.instance.collection('stops').snapshots();
    StreamBuilder<QuerySnapshot>(
                  stream: stops,
                 builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) 
                 {
                    if(snapshot.hasError)
                    {
                      print("Something went wrong");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      print("Loading");
                    }

                    final data=snapshot.requireData;
                                        print("hello ji");

                    return ListView.builder(itemCount: data.size,
                    itemBuilder: (context,index)
                    {
                      print("PLace is ${data.docs[index]['name']} and the distance is ${data.docs[index]['distance']}");
                      return Text("PLace is ${data.docs[index]['name']} and the distance is ${data.docs[index]['distance']}");
                    },);
                 },);
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
    
          primarySwatch: Colors.blue,
        ),
        home: newsPage(),
      ),
    );
  }
}
