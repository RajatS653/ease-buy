import 'package:ease_buy/Controllers/Home_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Home_Products_View.dart';

class Bag_Screen extends StatefulWidget {
  const Bag_Screen({Key? key}) : super(key: key);

  @override
  State<Bag_Screen> createState() => _Bag_ScreenState();
}

class _Bag_ScreenState extends State<Bag_Screen> {
  final B_Controller = Get.put(Home_control());


  int price = 500;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 225, 223, 223),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 150, 10, 10),
        centerTitle: true,

        title: Text(
          "My Cart",
          style: GoogleFonts.roboto(
              fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
      bottomNavigationBar: B_Controller.Cart.isEmpty
          ? null
          : GetBuilder<Home_control>(builder: (controller) {
            return Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 150, 10, 10),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Total = ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${controller.total} \$",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    )
                  ],
                ));
          },),
      body: B_Controller.Cart.isEmpty? Center(child: Text("Empty Cart", style: GoogleFonts.roboto(
          fontSize: 22, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic),),):SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    Container(
                      height: MediaQuery.of(context).size.height -
                          166, // Adjust this height as needed
                      child: GetBuilder<Home_control>(
                        builder: (value) {
                          return ListView.separated(
                            padding: EdgeInsets.only(bottom: 50),
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 10);
                            },
                            itemCount: value.Cart.length,
                            itemBuilder: (context, index) {
                              var product =
                              value.DoneDataList![value.Cart[index]-1];
                              return InkWell(
                                onTap: () {
                                  value.Product_Id(value.DoneDataList![value.Cart[index]-1]['id'], value.DoneDataList![value.Cart[index]-1]['description']);

                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return Home_Products_View();
                                  },));
                                },
                                child: Container(
                                  height: 120,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 130,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                            ),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    product['images'][0].toString()),
                                                fit: BoxFit.fill)),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              product['title'].toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              product['description'].toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromARGB(
                                                      255, 77, 75, 75)),
                                            ),
                                            Spacer(),
                                            Row(
                                              children: [
                                                Text(
                                                  "Quantity: 1",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  "Price: ",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Text(
                                                  "${product['price'].toString()} \$",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              value.remove_Cart(value.Cart[index], product['price']);
                                            });
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Color.fromARGB(255, 150, 10, 10),
                                          )),
                                      SizedBox(
                                        width: 5,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
