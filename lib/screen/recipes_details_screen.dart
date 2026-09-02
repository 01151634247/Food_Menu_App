import 'package:flutter/material.dart';
import 'package:food_menu_app/Domain/custom_text_field.dart';

class RecipesDetailsScreen extends StatefulWidget {
   String imageSrc;
   String title ;
   String cookTime;
   String prepTime;
   String rating;
   String calories;
   String revCount;
   String foodType;
   String difficultLevel;
  
    RecipesDetailsScreen({super.key,required this.imageSrc,required this.title,
    required this.cookTime,required this.prepTime,required this.rating,required this.calories,required this.revCount,required this.foodType,required this.difficultLevel
    });

  @override
  State<RecipesDetailsScreen> createState() => _RecipesDetailsScreenState();
}

class _RecipesDetailsScreenState extends State<RecipesDetailsScreen> {
  MediaQueryData? mediaQuery;
  @override
  Widget build(BuildContext context) {
     mediaQuery=MediaQuery.of(context);
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
         ),

         Align(
          alignment: AlignmentGeometry.bottomCenter,
          child: Container(
            
            height: mediaQuery!.size.height*0.55,
            width:mediaQuery!.size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.red,
                  blurRadius: 9,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 14),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,style:text.textStyle24.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
                ],
              ),
            ),
          ),
         ),
        ]
      )
    );
  }
}