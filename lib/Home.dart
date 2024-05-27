import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ease_buy/Controllers/Home_Controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Bottom_Nav.dart';
import 'Home_Products_View.dart';
import 'search.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final H_Controller = Get.put(Home_control());

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (H_Controller.DoneDataList!.isEmpty) {
        Fluttertoast.showToast(msg: "Check Internet Connection");
      }
      _timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(244, 247, 247, 247),
        body: StreamBuilder(
          stream: H_Controller.ApiCall().asStream(),
          builder: (context, snapshot) {
            if (H_Controller.DoneDataList!.isEmpty) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blueAccent,
                ),
              );
            }
            return ListView(padding: EdgeInsets.zero, children: [
              Container(
                height: 40,
                color: Colors.black,
              ),
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
                                image: AssetImage("Assets/ease_buy_logo.png"),
                                fit: BoxFit.fill)),
                      ),
                      Spacer(),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 110,
                        child: TextField(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return search_screen();
                              },
                            ));
                          },
                          keyboardType: TextInputType.text,
                          autofocus: false,
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
                            hintText: "Search for Products or Brands",
                            hintStyle: TextStyle(fontSize: 14),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 150, 10, 10),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                            return AllScreen(index: 2);
                          },), (route) => false);
                          print("cart");
                        },
                        child: Icon(Icons.shopping_cart_outlined,
                            size: 30, color: Color.fromARGB(255, 150, 10, 10)),
                      ),
                    ],
                  ),
                ),
              ),
              CarouselSlider(
                items: [
                  //1st Image of Slider
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("Assets/laptop_sale.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  //2nd Image of Slider
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("Assets/lakme.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  //3rd Image of Slider
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("Assets/Phone_sale.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 180.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 700),
                  viewportFraction: 0.8,
                ),
              ),
              GetBuilder<Home_control>(
                builder: (value) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // recommended
                      Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: RichText(
                            text: TextSpan(
                                text: "Recommended for you",
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\nbased on your interest",
                                    style: GoogleFonts.roboto(
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic),
                                  )
                                ]),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 265,
                        child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 1,
                            childAspectRatio: 1.75,
                          ),
                          itemCount: value.recommended.length,
                          itemBuilder: (context, RecIndex) {
                            return InkWell(
                              onTap: () {
                                // passing the product id and description of current product
                                H_Controller.Product_Id(
                                    value.DoneDataList![
                                        value.recommended[RecIndex]]['id'],
                                    value.DoneDataList![value
                                        .recommended[RecIndex]]['description']);
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return Home_Products_View();
                                  },
                                ));
                              },
                              child: Card(
                                surfaceTintColor: Colors.white,
                                elevation: 1,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 160,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 0.1),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              value.DoneDataList![value
                                                          .recommended[
                                                      RecIndex]]['images'][0]
                                                  .toString(),
                                            ),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "${value.DoneDataList![value.recommended[RecIndex]]['title']}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "${value.DoneDataList![value.recommended[RecIndex]]['description']}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.roboto(
                                                  color: Colors.grey,
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "\$ " +
                                                      "${value.DoneDataList![value.recommended[RecIndex]]['price']}",
                                                  style: GoogleFonts.roboto(
                                                      color: Color.fromARGB(
                                                          255, 150, 10, 10),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Spacer(),
                                                Text(
                                                  value.DoneDataList![value
                                                              .recommended[
                                                          RecIndex]]['rating']
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
                                                  size: 13,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // Sale
                      Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: RichText(
                            text: TextSpan(
                                text: "Winter Sale",
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\nup to 40% off",
                                    style: GoogleFonts.roboto(
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic),
                                  )
                                ]),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 265,
                        child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 1,
                            childAspectRatio: 1.75,
                          ),
                          itemCount: value.skincare.length,
                          itemBuilder: (context, SkinIndex) {
                            return InkWell(
                              onTap: () {
                                H_Controller.Product_Id(
                                    value.DoneDataList![
                                        value.skincare[SkinIndex]]['id'],
                                    value.DoneDataList![value
                                        .skincare[SkinIndex]]['description']);
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return Home_Products_View();
                                  },
                                ));
                              },
                              child: Card(
                                surfaceTintColor: Colors.white,
                                elevation: 1,
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 160,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 0.1),
                                            color: Color.fromARGB(
                                                255, 242, 242, 242),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  value.DoneDataList![
                                                          value.skincare[
                                                              SkinIndex]]
                                                          ['images'][0]
                                                      .toString(),
                                                ),
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          child: Container(
                                            height: 30,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 150, 10, 10),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Center(
                                                child: Text(
                                              "- " +
                                                  "${value.DoneDataList![value.skincare[SkinIndex]]['discountPercentage'].toString()}" +
                                                  "%",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.white,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "${value.DoneDataList![value.skincare[SkinIndex]]['title']}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "${value.DoneDataList![value.skincare[SkinIndex]]['description']}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.roboto(
                                                  color: Colors.grey,
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "\$ " +
                                                      "${value.DoneDataList![value.skincare[SkinIndex]]['price']}",
                                                  style: GoogleFonts.roboto(
                                                      color: Color.fromARGB(
                                                          255, 150, 10, 10),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Spacer(),
                                                Text(
                                                  value.DoneDataList![value
                                                              .skincare[
                                                          SkinIndex]]['rating']
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
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // you may also like
                      Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: RichText(
                            text: TextSpan(
                                text: "You may also like",
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\nbased on your interest",
                                    style: GoogleFonts.roboto(
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic),
                                  )
                                ]),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 265,
                        child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 1,
                            childAspectRatio: 1.75,
                          ),
                          itemCount: value.also_like.length,
                          itemBuilder: (context, LikeIndex) {
                            return InkWell(
                              onTap: () {
                                H_Controller.Product_Id(
                                    value.DoneDataList![
                                        value.also_like[LikeIndex]]['id'],
                                    value.DoneDataList![value
                                        .also_like[LikeIndex]]['description']);
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return Home_Products_View();
                                  },
                                ));
                              },
                              child: Card(
                                surfaceTintColor: Colors.white,
                                elevation: 1,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 160,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 0.1),
                                        color:
                                            Color.fromARGB(255, 242, 242, 242),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              value.DoneDataList![value
                                                          .also_like[LikeIndex]]
                                                      ['images'][0]
                                                  .toString(),
                                            ),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "${value.DoneDataList![value.also_like[LikeIndex]]['title']}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "${value.DoneDataList![value.also_like[LikeIndex]]['description']}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.roboto(
                                                  color: Colors.grey,
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "\$ " +
                                                      "${value.DoneDataList![value.also_like[LikeIndex]]['price']}",
                                                  style: GoogleFonts.roboto(
                                                      color: Color.fromARGB(
                                                          255, 150, 10, 10),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Spacer(),
                                                Text(
                                                  value.DoneDataList![value
                                                              .also_like[
                                                          LikeIndex]]['rating']
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
                                                  size: 13,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ]);
          },
        ));
  }
}
