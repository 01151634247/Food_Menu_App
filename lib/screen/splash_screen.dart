

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_menu_app/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), (){
      Navigator.push(context,MaterialPageRoute(builder: (context){
        return  HomeScreen();
      }));
      
    });
  }
 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     
      backgroundColor:Colors.orangeAccent ,
      body: Column(
        children: [
          
          const SizedBox(
            height: 250,
            width: 400,
          ),
           Text('Welcome',style: TextStyle(
            fontFamily: 'primary',
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black54,
          ),),
          const SizedBox(
            height: 10,
          ),
          
          ClipOval(child: Image.asset('assets/images/food-png.jpg',height: 300,width: 300,fit: BoxFit.cover,)),
           SizedBox(
            height: 10,
           ),
         
         
        ],
      ),
    );
  }
}