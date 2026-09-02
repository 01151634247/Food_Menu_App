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
   String cuisine;
   List<String>ingredientslist;
   List<String>instractionlist;
  
    RecipesDetailsScreen({super.key,required this.instractionlist,required this.imageSrc,required this.title,required this.ingredientslist,
    required this.cuisine,
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
              child: SingleChildScrollView(
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: mediaQuery!.size.width,
                      height:mediaQuery!.size.height*0.15,
                      child: Stack(
                        children: [
                          Text(widget.title,style:text.textStyle24.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                      
                           Positioned(
                          right:4,
                          top: 25,
                            child: Image.asset('assets/icons/heart (3).png',height:30,width:30,),),
                      
                            Positioned(
                              top: 40,
                              child:Row(
                                children: [
                                  Container(
                                     padding: EdgeInsets.symmetric(horizontal:10),
                                     decoration: BoxDecoration(
                                  color: Colors.white38,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.blueAccent,
                                  )
                                ),   
                                    child: Row(
                                    children: [
                                      Icon(Icons.person,color: Colors.blue,),
                                      Text(widget.revCount,style: text.textStyle18.copyWith(
                                        fontWeight: FontWeight.bold
                                      ),),
                                    
                                    ], ),
                                  ),
                              const SizedBox(
                                width: 15,
                              ),    
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal:10),
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.red.shade200,
                                  )
                                ),    
                                    child: Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.amber,),
                                      Text(widget.rating,style: text.textStyle18.copyWith(
                                        fontWeight: FontWeight.bold
                                      ),),
                                    
                                    ], ),
                                  ),
                                  
                                ],
                              ) 
                              ),
                      
                              ///////////////////////////////////////////////////////////////////////////
                      Positioned(
                        top: 80,
                        child:SizedBox(
                          width: mediaQuery!.size.width,
                          child: Row(    
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
                                  
                          children: [
                             Expanded(
                               child: Container(
                                                         
                                decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(12),
                               border: Border.all(
                                color: Colors.blue,
                                
                               ),
                                ),
                                child: Center(
                                  child: Text(widget.cuisine,style: text.textStyle12.copyWith(
                                  fontWeight: FontWeight.bold,
                                  ),),
                                ),
                                                         ),
                             ),
                              const SizedBox(
                            width: 7,
                           ), 
                            
                            Expanded(
                              child: Container(
                              
                                decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(12),
                               border: Border.all(
                                color: Colors.blue,
                               ),
                                ),
                                child: Center(
                                  child: Text(widget.difficultLevel,style: text.textStyle12.copyWith(
                                  fontWeight: FontWeight.bold,
                                  ),),
                                ),
                              ),
                            ),
                            const SizedBox(
                            width: 7,
                           ), 
                          
                                        
                           Expanded(
                             child: Container(
                             
                                decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(12),
                               border: Border.all(
                                color: Colors.blue,
                               ),
                                ),
                                child: Center(
                                  child: Text(widget.foodType,style: text.textStyle12.copyWith(
                                  fontWeight: FontWeight.bold,
                                  ),),
                                ),
                              ),
                           ),
                                                
                           const SizedBox(
                            width: 30,
                           ),                    
                                               
                          ],
                                              ),
                        ),
                      ),
                      
                        ],
                      ),
                    ),


                    ////////
                    ////////
                    //////
                    ///
                    ///
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal:10,vertical:25),   
                            child: Column(
                              children: [
                                Image.asset('assets/icons/whisk.png',height: 50,),
                                Text('${widget.prepTime} min',style: text.textStyle24.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),),
                                 Text('Preparation Time',style: text.textStyle18.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'secondary'
                                  
                            
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
                            padding: const EdgeInsets.symmetric(horizontal:25,vertical: 25),
                            child: Column(
                              children: [
                                Image.asset('assets/icons/cooking.png',height: 50,),
                                Text('${widget.cookTime} min',style: text.textStyle24.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),),
                                 Text('Cooking Time',style: text.textStyle18.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'secondary',
                                  
                            
                                 ),
                                 ),
                              ],
                            ),
                          ),
                        ),
                      
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Ingredients',style: text.textStyle24.copyWith(
                      fontWeight: FontWeight.bold,
                    ),),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:widget.ingredientslist.length,
                      itemBuilder:(context,index){
                        return Padding(
                          padding: const EdgeInsets.only(bottom:10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.blueAccent.shade100.withOpacity(0.5),
                          
                            ),
                            child: Row(
                              children: [
                                  Image.asset('assets/icons/check-mark.png',width: 40,height:40,),
                                  const SizedBox(width: 10,),
                                Expanded(
                                  child: Text(widget.ingredientslist[index],style: text.textStyle24.copyWith(
                                    fontSize: 20,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                                             ),
                                ),
                                                 
                              ],
                            ),
                          ),
                        );
                      
                    }
                    ),
                      Text('InStructions',style: text.textStyle24.copyWith(
                      fontWeight: FontWeight.bold,
                    ),),

                    ListView.builder(
                      itemCount:widget.instractionlist.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: mediaQuery!.size.width*0.3,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(7),
                                  bottomLeft: Radius.circular(7)

                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(100)
                                    ),
                                    child: Center(child: Text('${index+1}',style: text.textStyle18.copyWith(
                                      fontFamily: 'secondary',
                                      fontWeight: FontWeight.bold,
                                    ),)),
                                  ),
                                  Text('Step',style: text.textStyle24.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'secondary',
                                  ),),
                                ],
                              ),
                            ),
                            Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.blueAccent.shade100.withOpacity(0.5),
                                
                                  ),
                                  child: Row(
                                    children: [
                                        Image.asset('assets/icons/arrow-right.png',width: 40,height:40,),
                                        const SizedBox(width: 10,),
                                      Expanded(
                                        child: Text(widget.instractionlist[index],style: text.textStyle24.copyWith(
                                          fontSize: 20,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines:3,
                                                                     ),
                                      ),
                                                       
                                    ],
                                  ),
                                ),
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          ),
         ),
        ]
      )
    );
  }
}