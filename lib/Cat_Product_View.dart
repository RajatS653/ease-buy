import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Controllers/Home_Controller.dart';
import 'Controllers/Category_Controller.dart';

class Cat_Product_View extends StatefulWidget {
  const Cat_Product_View({Key? key}) : super(key: key);

  @override
  State<Cat_Product_View> createState() => _Cat_Product_ViewState();
}

class _Cat_Product_ViewState extends State<Cat_Product_View> {
  final H_controller = Get.put(Home_control());
  final Cat_Controller = Get.put(Category_Control());

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
              backgroundColor: Color.fromARGB(255, 150, 10, 10),
            ),
            onPressed: () {},
            child: Text(
              "ADD TO CART",
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GetBuilder<Category_Control>(
          builder: (value) {
            return Text(
              value.product_Des.toString(),
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            );
          },
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            size: 20,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              GetBuilder<Category_Control>(
                builder: (value) {
                  int productIndex = value.Categories_Data
                      ?.indexWhere((product) => product['id'] == value.product_Id) ?? -1;

                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 400,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: value.Categories_Data![productIndex]['images'].length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 1),
                                  child: Container(
                                    height: 400,
                                    width: 275,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          value.Categories_Data![productIndex]['images'][index].toString(),
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
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
                              value.Categories_Data![productIndex]['title'].toString(),
                              style: GoogleFonts.roboto(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: value.Categories_Data![productIndex]['rating'].toDouble(),
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
                                  "(${value.Categories_Data![productIndex]['rating']})",
                                  style: GoogleFonts.roboto(
                                    color: Color.fromARGB(255, 100, 100, 100),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "\$${value.Categories_Data![productIndex]['price']}",
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: Color.fromARGB(255, 150, 10, 10),
                                  ),
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
                                  fontWeight: FontWeight.w600,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: value.Categories_Data![productIndex]['brand'].toString(),
                                    style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Description:-",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              value.Categories_Data![productIndex]['description'].toString(),
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
