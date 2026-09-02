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
                  SizedBox(
                    width: mediaQuery!.size.width,
                    height: 100,
                    child: Stack(
                      children: [
                        Text(widget.title,style:text.textStyle24.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                    
                         Positioned(
                        right:4,
                        top: 25,
                          child: Image.asset('assets/icons/heart (3).png',height:30,width:30,)),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),   
                          child: Column(
                            children: [
                              Image.asset('assets/icons/whisk.png',height: 50,),
                              Text('${widget.prepTime} min',style: text.textStyle24.copyWith(
                                fontWeight: FontWeight.bold,
                              ),),
                               Text('Preparation Time',style: text.textStyle18.copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'primary'
                                
                          
                               ),
                               ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),


           Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:27,vertical: 10),
                          child: Column(
                            children: [
                              Image.asset('assets/icons/cooking.png',height: 50,),
                              Text('${widget.cookTime} min',style: text.textStyle24.copyWith(
                                fontWeight: FontWeight.bold,
                              ),),
                               Text('Cooking Time',style: text.textStyle18.copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'primary'
                                
                          
                               ),
                               ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  )
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