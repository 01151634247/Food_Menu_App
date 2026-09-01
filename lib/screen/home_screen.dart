import 'package:flutter/material.dart';
import 'package:food_menu_app/API/api.dart';
import 'package:food_menu_app/Domain/custom_text_field.dart';

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
        padding: const EdgeInsets.only(top: 10),
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
                        childAspectRatio: .89,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      
                        crossAxisCount: 2),
                      itemBuilder: (context,index){
                        return Card(
                          child: Column(
                            children: [
                              Container(
                                height: 170,
                                 decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(top:Radius.circular(12)),
                                  image:DecorationImage(image: NetworkImage('${myRecipes[index].image}'),fit: BoxFit.cover,),
                                  ),
                                  
                                 ),
                                
                                 Text('${myRecipes[index].name}',
                                 style: text.textStyle18.copyWith(
                                  fontWeight: FontWeight.bold
                                 ),
                                 overflow: TextOverflow.ellipsis,),
              
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