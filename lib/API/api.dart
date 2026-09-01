
import 'dart:convert';

import 'package:food_menu_app/model/menu_model.dart';
import 'package:http/http.dart' as http;


class Api{


  Future<MenuDatamodel?> getapi()async{
     String Url='https://dummyjson.com/recipes'; 
     Uri uri=Uri.parse(Url);
     http.Response res = await http.get(uri);


     if(res.statusCode==200){
     var resData = jsonDecode(res.body);


     return MenuDatamodel.fromJson(resData);

     }else{
      return null;
     }
    
  }


}