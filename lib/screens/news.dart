import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import './config_auth.dart';

class newsPage extends StatefulWidget {
  const newsPage({ Key? key }) : super(key: key);

  @override
  State<newsPage> createState() => _newsPageState();
}

class _newsPageState extends State<newsPage> {

  var api_id = '$apiId';
  String news="";
  String urlimg="";
  void getNewsMan() async
  {
    
    getNews();
  }

  void getNews() async
  {
    
    var url=Uri.parse("https://newsapi.org/v2/everything?q=disaster&from=2023-02-07&sortBy=popularity&apiKey=$api_id");
    http.Response response=await http.get(url);
    print(response.body);

    if(response.statusCode==200)
    {
      
      setState(() {
        var data=response.body;
        news=jsonDecode(data)['articles'][0]['description'].toString();
        urlimg=jsonDecode(data)['articles'][0]['urlToImage'].toString();
        print(news);
      });
      
    }
    else
    {
      print('error occured');
    }
  
  }

  void initstate()
  {
    super.initState();
    getNewsMan();
  }
  
  @override
  Widget contain(BuildContext context,var highlight,var urlimg)
  {
    getNewsMan();
    return(Text(news));
  }
  Widget build(BuildContext context) {
    setState(() {
      getNewsMan();
    });
    getNewsMan();
    print(news);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              contain(context,news,urlimg)
            ]
          ),
        ),
      ),
    );
  }
}