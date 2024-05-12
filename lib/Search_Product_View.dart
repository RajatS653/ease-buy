import 'package:ease_buy/Controllers/Home_Controller.dart';
import 'package:ease_buy/Controllers/Search_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Search_Product_view extends StatefulWidget {
  const Search_Product_view({super.key});

  @override
  State<Search_Product_view> createState() => _Search_Product_viewState();
}

class _Search_Product_viewState extends State<Search_Product_view> {
  final S_Controller = Get.put(Search_Control());
  final H_Controller = Get.put(Home_control());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 150, 10, 10)),
              onPressed: () {},
              child: Text(
                "ADD TO CART",
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              )),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          S_Controller.product_Des.toString(),
          style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              size: 20,
            )),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              GetBuilder<Search_Control>(
                builder: (S_Controller) {
                  int productIndex = S_Controller.searchDataList
                      .indexWhere((product) => product['id'] == S_Controller.product_Id);

                  if (productIndex == -1) {
                    return Center(
                      child: Text('Product not found'),
                    );
                  }
                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 400,
                            child: ListView.builder(

                              scrollDirection: Axis.horizontal,
                              itemCount: S_Controller.searchDataList[productIndex]['images'].length, // bcz i want to access the 0th index of searchDataList and i have the product id of 1st item
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 1),
                                  child: Container(
                                    height: 400,
                                    width: 275,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${S_Controller.searchDataList[productIndex]['images'][index].toString()}"),
                                            fit: BoxFit.fill)),
                                  ),
                                );
                              },
                            ),
                          ),
                          // Align(
                          //     alignment: Alignment.topRight,
                          //     child: Padding(
                          //       padding: const EdgeInsets.symmetric(
                          //           horizontal: 25, vertical: 20),
                          //       child: IconButton(
                          //         onPressed: () {
                          //           // storing the product id S_Controller in Product_id
                          //           int product_id = S_Controller
                          //               .searchDataList[productIndex]
                          //           ['id'];
                          //
                          //           if (H_Controller.Favourites.contains(product_id)) {
                          //             H_Controller.remove_Fav(product_id);
                          //             Fluttertoast.showToast(
                          //               msg: "Removed from Favourites",
                          //               backgroundColor: Colors.white,
                          //               textColor: Colors.black,
                          //             );
                          //           } else {
                          //             H_Controller.add_Fav(product_id);
                          //             Fluttertoast.showToast(
                          //               msg: "Added to Favourites",
                          //               backgroundColor: Colors.white,
                          //               textColor: Colors.black,
                          //             );
                          //           }
                          //         },
                          //         icon: Icon(
                          //           H_Controller.Favourites.contains(
                          //               S_Controller.searchDataList[
                          //               productIndex]['id'])
                          //               ? Icons.favorite_outlined
                          //               : Icons.favorite_outline_sharp,
                          //           size: 30,
                          //           color: H_Controller.Favourites.contains(
                          //               S_Controller.searchDataList[
                          //               productIndex]['id'])
                          //               ? Colors.pink
                          //               : Colors.grey,
                          //         ),
                          //       ),
                          //     )),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S_Controller.searchDataList[productIndex]['title']
                                  .toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: 22, fontWeight: FontWeight.w800),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: S_Controller
                                      .searchDataList[productIndex]
                                  ['rating']
                                      .toDouble(),
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 16,
                                  direction: Axis.horizontal,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "(" +
                                      S_Controller.searchDataList[productIndex]
                                      ['rating']
                                          .toString() +
                                      ")",
                                  style: GoogleFonts.roboto(
                                      color: Color.fromARGB(255, 100, 100, 100),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                Spacer(),
                                Text(
                                  "\$ " +
                                      S_Controller.searchDataList[productIndex]
                                      ['price']
                                          .toString(),
                                  style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Color.fromARGB(255, 150, 10, 10)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RichText(
                              text: TextSpan(
                                  text: "Brand Name:  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: S_Controller
                                            .searchDataList[productIndex]
                                        ['brand']
                                            .toString(),
                                        style: GoogleFonts.roboto(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500))
                                  ]),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Description:-",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)),
                            Text(
                              S_Controller.searchDataList[productIndex]
                              ['description']
                                  .toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
