import 'package:ease_buy/Controllers/Home_Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home_Products_View extends StatefulWidget {
  const Home_Products_View({Key? key}) : super(key: key);

  @override
  State<Home_Products_View> createState() => _Home_Products_ViewState();
}

class _Home_Products_ViewState extends State<Home_Products_View> {
  final H_controller = Get.put(Home_control());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          H_controller.product_Des.toString(),
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    GetBuilder<Home_control>(
                      builder: (value) {
                        return Column(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  height: 400,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: value
                                        .DoneDataList![value.product_Id - 1]
                                    ['images']
                                        .length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                        const EdgeInsets.only(right: 1),
                                        child: Container(
                                          height: 400,
                                          width: 275,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "${value.DoneDataList![value.product_Id - 1]['images'][index].toString()}"),
                                                  fit: BoxFit.fill)),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 20),
                                    child: IconButton(
                                      onPressed: () {
                                        int product_id = value
                                            .DoneDataList![value.product_Id - 1]
                                        ['id'];

                                        if (value.Favourites
                                            .contains(product_id)) {
                                          value.remove_Fav(product_id);
                                          Fluttertoast.showToast(
                                            msg: "Removed from Favourites",
                                            backgroundColor: Colors.white,
                                            textColor: Colors.black,
                                          );
                                        } else {
                                          value.add_Fav(product_id);
                                          Fluttertoast.showToast(
                                            msg: "Added to Favourites",
                                            backgroundColor: Colors.white,
                                            textColor: Colors.black,
                                          );
                                        }
                                      },
                                      icon: Icon(
                                        value.Favourites.contains(value
                                            .DoneDataList![
                                        value.product_Id - 1]['id'])
                                            ? Icons.favorite_outlined
                                            : Icons.favorite_outline_sharp,
                                        size: 30,
                                        color: value.Favourites.contains(
                                            value.DoneDataList![
                                            value.product_Id - 1]['id'])
                                            ? Colors.pink
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.DoneDataList![value.product_Id - 1]
                                    ['title']
                                        .toString(),
                                    style: GoogleFonts.roboto(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Row(
                                    children: [
                                      RatingBarIndicator(
                                        rating: value
                                            .DoneDataList![
                                        value.product_Id - 1]['rating']
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
                                            value
                                                .DoneDataList![
                                            value.product_Id - 1]
                                            ['rating']
                                                .toString() +
                                            ")",
                                        style: GoogleFonts.roboto(
                                            color: Color.fromARGB(
                                                255, 100, 100, 100),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Spacer(),
                                      Text(
                                        "\$ " +
                                            value
                                                .DoneDataList![
                                            value.product_Id - 1]
                                            ['price']
                                                .toString(),
                                        style: GoogleFonts.roboto(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                            color: Color.fromARGB(
                                                255, 150, 10, 10)),
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
                                              text: value
                                                  .DoneDataList![
                                              value.product_Id - 1]
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
                                    value.DoneDataList![
                                    value.product_Id - 1]['description']
                                        .toString(),
                                    style: GoogleFonts.roboto(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () { if(H_controller.Cart.contains(H_controller.DoneDataList![H_controller.product_Id - 1]['id'])){
              Fluttertoast.showToast(msg: "Already in cart");
            }

             else{
              H_controller.add_Cart(
                  H_controller.DoneDataList![H_controller.product_Id - 1]['id']);
                H_controller.Cart_total(H_controller.DoneDataList![H_controller.product_Id - 1]['price']);
              Fluttertoast.showToast(
                msg: "Added to Cart",
                backgroundColor: Colors.white,
                textColor: Colors.black,
              );
            }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 150, 10, 10),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Add To Cart",
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
