import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Search_Control extends GetxController {
  late Map<String, dynamic> searchData = {};
  late List<dynamic> searchDataList = [];

  Future SearchAPI(String? searchText) async {
    try {
      if(searchDataList.isNotEmpty){
        searchDataList=[];
      }
      http.Response response = await http.get(
        Uri.parse("https://dummyjson.com/products/search?q=$searchText"),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        searchData = jsonResponse;
        searchDataList = jsonResponse['products']; // Assuming 'products' is the key containing your search results

      } else {
        // Handle errors
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
    }
    update();
  }
}
