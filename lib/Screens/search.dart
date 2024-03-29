
import 'package:ease_buy/Controllers/Search_Controller.dart';
import 'package:ease_buy/Screens/Search_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class search_screen extends StatefulWidget {
  const search_screen({Key? key}) : super(key: key);

  @override
  State<search_screen> createState() => _search_screenState();
}

class _search_screenState extends State<search_screen> {

  TextEditingController searchControl = TextEditingController();
  var S_Controller = Get.put(Search_Control());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<Search_Control>(
          builder: (searchController) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 60,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: searchControl,
                          autofocus: true,
                          cursorColor: Color.fromARGB(255, 150, 10, 10),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(width: 0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 150, 10, 10),
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(width: 0),
                            ),
                            hintText: "Search for Products, Brands and More",
                            hintStyle: TextStyle(fontSize: 14),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 150, 10, 10),
                            ),
                          ),
                          onChanged: (value) {
                          },
                          onSubmitted: (value) {
                            S_Controller.SearchAPI(searchControl.text);
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return Search_Product_Screen(Text: searchControl.text);

                            },));

                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}





