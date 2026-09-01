import 'package:flutter/material.dart';
import 'package:food_menu_app/API/api.dart';

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
      body: Center(
        child:FutureBuilder(
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
                  childAspectRatio: .9,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                
                  crossAxisCount: 2),
                itemBuilder: (context,index){
                  return Card(
                    child: Column(
                      children: [
                        Image.network('${myRecipes[index].image}'),
                           Text('${myRecipes[index].name}',
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