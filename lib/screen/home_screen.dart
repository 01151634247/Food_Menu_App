import 'package:flutter/material.dart';
import 'package:food_menu_app/API/api.dart';
import 'package:food_menu_app/Domain/custom_text_field.dart';
import 'package:food_menu_app/screen/recipes_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   void initState() {
    Api().getapi();
   
    
    super.initState();
  }
  @override
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitchen Craft',style: text.textStyle24.copyWith(
          fontFamily: 'secondary',
          fontWeight: FontWeight.bold,
          
        ),),
        shadowColor: Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        )),
        centerTitle:true,
        backgroundColor: Colors.orange.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10,left:3,right: 3),
        child: Column(
          children: [
            Text('Most loved ',style: text.textStyle18.copyWith(
          fontFamily: 'secondary',
          fontWeight: FontWeight.bold,
          
        ),),
        SizedBox(
          height: 5,
        ),
            Expanded(
              child: FutureBuilder(
                future: Api().getapi(),
                 builder: (context,snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }else if(snapshot.hasError ){
                    return Center(
                      child: Text('Error found :${snapshot.error}'),
                    );
                  }else if(snapshot.hasData){
                    var myRecipes=snapshot.data!.recipes!;
                     return GridView.builder(
              
                      itemCount: snapshot.data!.recipes!.length,
                      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.58,
                        mainAxisSpacing: 3,
                        crossAxisSpacing: 3,
                      
                        crossAxisCount: 2),
                      itemBuilder: (context,index){
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 200,
                                 decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),                        
                                  image:DecorationImage(image: NetworkImage('${myRecipes[index].image}'),fit: BoxFit.cover,),
                                  ),
                                  
                                 ),
                                const SizedBox(
                                  height: 4,
                                ),
                                 Text('${myRecipes[index].name}',
                                 style: text.textStyle18.copyWith(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold
                                 ),
                                 overflow: TextOverflow.ellipsis,),
                                  const SizedBox(
                                  height: 4,
                                ),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     Text('Calories: ',style: text.textStyle18.copyWith(
                                      color: Colors.black87,
                                     ),),
                                     Text('${myRecipes[index].caloriesPerServing}',style: text.textStyle18.copyWith(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                     ),),
                                   ],
                                 ),
                                 const SizedBox(
                                  height: 5,
                                 ),

                            ///////////////////////////////
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(                                 
                                          borderRadius: BorderRadiusGeometry.circular(8),
                                        ),
                                        backgroundColor: Colors.orange.shade200,
                                      ),
                                      onPressed: (){
                                        Navigator.push(context,MaterialPageRoute(builder: (context){
                                          return RecipesDetailsScreen(
                                            instractionlist: myRecipes[index].instructions??[],
                                            ingredientslist:myRecipes[index].ingredients??[],
                                            cuisine:myRecipes[index].cuisine.toString() ,
                                            imageSrc:myRecipes[index].image.toString(),
                                          title:myRecipes[index].name.toString(), 
                                          cookTime:myRecipes[index].cookTimeMinutes.toString(),
                                           prepTime: myRecipes[index].prepTimeMinutes.toString(),
                                            rating: myRecipes[index].rating.toString(),
                                             calories:myRecipes[index].caloriesPerServing.toString(), 
                                             revCount: myRecipes[index].reviewCount.toString(),
                                              foodType:  myRecipes[index].mealType.toString(), 
                                              difficultLevel: myRecipes[index].difficulty.toString(),
                                              );
                                        }));
                                      },
                                     child:Text('View',style: text.textStyle18.copyWith(
                                      fontWeight: FontWeight.bold
                                     ),),),
                                     const SizedBox(
                                width:12,
                               ),
                                      
                                     Text('${myRecipes[index].cookTimeMinutes}Min',style: text.textStyle18.copyWith(
                                      fontWeight: FontWeight.bold,
                                     ),),
                                  ],
                                 ),
              
                            ],
                          ),
                        );
                      });
              
                  }
                  
                 return Container();
                 }
                 ),
            ),
          ],
        ),
      ),

      
    );
  }
}


/**
 * 
 * 
 * ListView.builder(
                itemCount: snapshot.data!.recipes!.length,
                itemBuilder:(context,index){
                  return ListTile(
                    leading: Image.network('${snapshot.data!.recipes![index].image}'),
                    title: Text('${snapshot.data!.recipes![index].name}'),

                  );

                }
                );
 */