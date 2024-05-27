import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Home_control extends GetxController {
  late Map<String, dynamic>? data = {};
  late List<dynamic>? DoneDataList = [];

  List Category_type = [
    "smartphones",
    "laptops",
    "fragrances",
    "skincare",
    "home-decoration",
  ];

  Future<void> ApiCall() async {
    try {
      http.Response response =
          await http.get(Uri.parse("https://dummyjson.com/products"));
      if (response.statusCode == 200) {
        data = await jsonDecode(response.body.toString());
        DoneDataList = data!['products'];
        //Add Categorised data into the empty Categories list
        if (recommended.isEmpty) {
          // for add the data only one time
          for (int i = 0; i < DoneDataList!.length; i++) {
            if (DoneDataList![i]['category'] == 'fragrances') {
              Recommended(i);
            }
            else if (DoneDataList![i]['category'] == 'beauty') {
              Check_Skincare(i);
            }
            else if (DoneDataList![i]['category'] == 'groceries') {
              AlsoLike(i);
            }
            else{

            }
          }
        }
      }
    } catch (error) {
      print("Error in API call: $error");
    }
    update();
  }

  late List recommended = [];
  Recommended(int index) {
    recommended.add(index);
    update();
  }

  late List also_like = [];
  AlsoLike(int index) {
    also_like.add(index);
    update();
  }


  late List skincare = [];
  Check_Skincare(int index) {
    skincare.add(index);
    update();
  }


  late int product_Id;
  late String product_Des;
  void Product_Id(int id, String Description) {
    product_Id = id;
    product_Des = Description;
    update();
  }

  late List Favourites = [];
  void add_Fav(int id) {
    Favourites.add(id);
    update();
  }

  void remove_Fav(int id) {
    Favourites.remove(id);
    update();
  }

  late List Cart = [];


  void add_Cart(int id) {

    Cart.add(id);

    update();
  }


  late double total = 0;
  void Cart_total(double price){
    total = total+price;
    update();
  }


  void remove_Cart(int id, double price) {
    Cart.remove(id);
    total = total-price;
    update();
  }

  }
