import 'package:ease_buy/Controllers/Home_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Bag_Screen extends StatefulWidget {
  const Bag_Screen({Key? key}) : super(key: key);

  @override
  State<Bag_Screen> createState() => _Bag_ScreenState();
}

class _Bag_ScreenState extends State<Bag_Screen> {
  final B_Controller = Get.put(Home_control());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 222, 222),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                B_Controller.Cart.isEmpty
                    ? Center(child: Text("Cart Is Empty"))
                    : SizedBox(height: 80),
                Text(
                  "My Cart",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20,),

                GetBuilder<Home_control>(
                  builder: (value) {
                    return value.Cart.isEmpty
                        ? Container() // Return an empty container if cart is empty
                        : Container(
                      height: MediaQuery.of(context).size.height-171, // Set a specific height
                      child: ListView.separated(

                        padding: EdgeInsets.zero,
                        separatorBuilder: (context, index) {
                          return Container(
                            height: 10,
                            color: Colors.transparent,
                          );
                        },
                        itemCount: value.Cart.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
