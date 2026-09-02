import 'package:flutter/material.dart';

class RecipesDetailsScreen extends StatefulWidget {
  String imageSrc;
   RecipesDetailsScreen({super.key,required this.imageSrc});

  @override
  State<RecipesDetailsScreen> createState() => _RecipesDetailsScreenState();
}

class _RecipesDetailsScreenState extends State<RecipesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network('${widget.imageSrc}'),
      
         Positioned(
          top: 20,
          left: 8,
           child: FloatingActionButton(onPressed: (){
            Navigator.pop(context);
           },
           backgroundColor: Colors.black38,
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            
            
            
           ),
           child:Icon(Icons.arrow_back_ios_new_rounded,size: 30,color: Colors.white,),
           ),
         )
      
        ],
      )
    );
  }
}