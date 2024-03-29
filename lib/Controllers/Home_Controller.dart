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
        if (smartphones.isEmpty) {
          // for add the data only one time
          for (int i = 0; i < DoneDataList!.length; i++) {
            if (DoneDataList![i]['category'] == 'smartphones') {
              Check_Smartphones(i);
              Recommended(i);
            }
            if (DoneDataList![i]['category'] == 'laptops') {
              Check_Laptops(i);
              Recommended(i);
            }
            if (DoneDataList![i]['category'] == 'fragrances') {
              Check_Fragrances(i);
              AlsoLike(i);
            }
            if (DoneDataList![i]['category'] == 'skincare') {
              Check_Skincare(i);
            }
            if (DoneDataList![i]['category'] == 'home-decoration') {
              Check_Home_Decoration(i);
              AlsoLike(i);
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

  late List smartphones = [];
  Check_Smartphones(int index) {
    smartphones.add(index);
    update();
  }

  late List laptops = [];
  Check_Laptops(int index) {
    laptops.add(index);
    update();
  }

  late List fragrances = [];
  Check_Fragrances(int index) {
    fragrances.add(index);
    update();
  }

  late List skincare = [];
  Check_Skincare(int index) {
    skincare.add(index);
    update();
  }

  late List home_Decoration = [];
  Check_Home_Decoration(int index) {
    home_Decoration.add(index);
    update();
  }

  late int product_Id;
  late String product_Des;
  void Product_Id(int id, String Description) {
    product_Id = id;
    product_Des = Description;
    update();
  }

  late List Favourites = [2, 6, 10, 15, 20, 25];
  void add_Fav(int id) {
    Favourites.add(id);
    update();
  }

  void remove_Fav(int id) {
    Favourites.remove(id);
    update();
  }
}
