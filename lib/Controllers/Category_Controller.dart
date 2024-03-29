import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class Category_Control extends GetxController{
  late List<dynamic>? Categories = [];
  Future<void> CatApiCall() async{
    http.Response response= await http.get(Uri.parse("https://dummyjson.com/products/categories"));
    if(response.statusCode==200){
      Categories = await jsonDecode(response.body.toString());
    }
    update();
  }


  late Map<String, dynamic>? data = {};
  late List<dynamic>? Categories_Data = [];
  Future<void> Cat_Data_ApiCall(String Category) async{
    if(Categories_Data!.isNotEmpty){
      Categories_Data=[];
    }
    http.Response response =
    await http.get(Uri.parse("https://dummyjson.com/products/category/$Category"));
    if (response.statusCode == 200) {
      data = await jsonDecode(response.body.toString());
     Categories_Data = data!['products'];
      print(Categories_Data);
    }
    update();
  }

}