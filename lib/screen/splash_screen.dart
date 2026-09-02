

import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:food_menu_app/Domain/custom_text_field.dart';
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
    Timer(const Duration(seconds:5), (){
      Navigator.push(context,MaterialPageRoute(builder: (context){
        return  HomeScreen();
      }));
      
    });
  }
 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     
      backgroundColor:Colors.orangeAccent ,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 46,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(child: Image.asset('assets/images/food-png.jpg',height: 300,width: 300,fit: BoxFit.cover,)),
             SizedBox(
              height: 10,
             ),
        
             SizedBox(
              height: 60,
              child: DefaultTextStyle(style:text.textStyle48.copyWith(
                fontFamily: 'secondary',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ), 
              child:AnimatedTextKit(
                animatedTexts: [
                 ScaleAnimatedText('Menu'),
                ScaleAnimatedText('Kitchen'),
              ])),
             )
           
           
          ],
        ),
      ),
    );
  }
}