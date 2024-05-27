import 'package:ease_buy/Controllers/Home_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Home_Products_View.dart';

class Favourites_Screen extends StatefulWidget {
  const Favourites_Screen({super.key});

  @override
  State<Favourites_Screen> createState() => _Favourites_ScreenState();
}

class _Favourites_ScreenState extends State<Favourites_Screen> {
  final Fav_Controller = Get.put(Home_control());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 150, 10, 10),
        centerTitle: true,
        title: Text(
          "Favourites",
          style: GoogleFonts.roboto(
              fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
      body: Fav_Controller.Favourites.isEmpty? Center(child: Text("No Favourites yet !!", style: GoogleFonts.roboto(
          fontSize: 22, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic),),):  Column(
        children: [
          GetBuilder<Home_control>(
            builder: (value) {
              return Expanded(
                child: GridView.builder(
                  itemCount: value.Favourites.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    childAspectRatio: 0.59,
                  ),
                  itemBuilder: (context, In_index) {
                    var product =
                    value.DoneDataList![value.Favourites[In_index]-1]; // bcz i want to access the 0th element of Favourite list and i have the product id which is +1 of index
                    return InkWell(
                      onTap: () {
                        value.Product_Id(value.DoneDataList![value.Favourites[In_index]-1]['id'], value.DoneDataList![value.Favourites[In_index]-1]['description']);

                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Home_Products_View();
                        },));
                      },
                      child: Container(
                        height: 300,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              height: 220,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(product['images'][0].toString()),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 7),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product['title'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      product['description'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                          color: Colors.grey,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "\$ " + product['price'].toString(),
                                          style: GoogleFonts.roboto(
                                              color: Color.fromARGB(
                                                  255, 150, 10, 10),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Spacer(),
                                        Text(
                                          product['rating'].toString(),
                                          style: TextStyle(
                                              color:
                                              Color.fromARGB(255, 5, 153, 28),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.green,
                                          size: 15,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
