import 'package:ease_buy/Controllers/Search_Controller.dart';
import 'package:ease_buy/Search_Product_View.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Search_Product_Screen extends StatefulWidget {
  final String Text;
  const Search_Product_Screen({super.key, required this.Text});

  @override
  State<Search_Product_Screen> createState() => _Search_Product_ScreenState();
}

class _Search_Product_ScreenState extends State<Search_Product_Screen> {
  final S_Controller = Get.put(Search_Control());
  TextEditingController Search_Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 245, 245, 245),
          body: StreamBuilder(
            stream: S_Controller.SearchAPI(widget.Text).asStream(),
            builder: (context, snapshot) {
              if (S_Controller.searchDataList.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.blueAccent,
                  ),
                );
              }
              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 70,
                        color: Color.fromARGB(244, 247, 247, 247),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "Assets/ease_buy_logo.png"),
                                        fit: BoxFit.fill)),
                              ),
                              Spacer(),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width - 110,
                                child: TextField(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  controller: Search_Controller,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Color.fromARGB(255, 150, 10, 10),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(width: 0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 150, 10, 10),
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(width: 0),
                                    ),
                                    hintText: "Search for products",
                                    hintStyle: TextStyle(fontSize: 14),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Color.fromARGB(255, 150, 10, 10),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.shopping_cart_outlined,
                                  size: 30,
                                  color: Color.fromARGB(255, 150, 10, 10)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: RichText(
                          text: TextSpan(
                              text: "Showing search results for ",
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                    text: "${widget.Text}",
                                    style: GoogleFonts.roboto(
                                        fontSize: 18,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic))
                              ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: RichText(
                          text: TextSpan(
                              text: "Total ",
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                    text:
                                        "${S_Controller.searchDataList.length}",
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(
                                  text: " results",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ]),
                        ),
                      ),
                      GetBuilder<Search_Control>(
                        builder: (value) {
                          return InkWell(
                            onTap: () {

                            },
                            child: GridView.builder(
                              itemCount: value.searchDataList.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 1,
                                crossAxisSpacing: 1,
                                childAspectRatio: 0.59,
                              ),
                              itemBuilder: (context, In_index) {
                                dynamic product = value.searchDataList[In_index];
                                return InkWell(
                                  onTap: () {
                                    value.Product_Id(product['id'], product['description']);
                                    print(product['id']);
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return Search_Product_view();
                                      },
                                    ));
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
                                                image: NetworkImage(
                                                    product['images'][0]),
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                        Container(
                                          height: 100,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 7),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  product['title'],
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  product['description'],
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.grey,
                                                      fontStyle: FontStyle.italic,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "\$ " +
                                                          product['price']
                                                              .toString(),
                                                      style: GoogleFonts.roboto(
                                                          color: Color.fromARGB(
                                                              255, 150, 10, 10),
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    Spacer(),
                                                    Text(
                                                      product['rating']
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 153, 28),
                                                          fontWeight:
                                                              FontWeight.w500,
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
                ],
              );
            },
          )),
    );
  }
}
