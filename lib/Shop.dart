import 'package:carousel_slider/carousel_slider.dart';
import 'package:ease_buy/Cat_Product_View.dart';
import 'package:ease_buy/Controllers/Category_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'search.dart';

class Shop_Screen extends StatefulWidget {
  const Shop_Screen({super.key});

  @override
  State<Shop_Screen> createState() => _Shop_ScreenState();
}

class _Shop_ScreenState extends State<Shop_Screen> {
  final Cat_Controller = Get.put(Category_Control());
  int selectedIndex = 0;

  void printSelectedCategory() {
    if (selectedIndex != -1) {
      print("Selected category: ${Cat_Controller.Categories![selectedIndex]}"); }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 150, 10, 10),
          centerTitle: true,
          title: Text(
            "Categories",
            style: GoogleFonts.roboto(
                fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 12),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return search_screen();
                        },
                      ));
                    },
                    icon: Icon(
                      Icons.search,
                      size: 27,
                      color: Colors.white,
                    )))
          ],
        ),
        body: StreamBuilder(
          stream: Cat_Controller.CatApiCall().asStream(),
          builder: (context, snapshot) {
            return Cat_Controller.Categories!.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  )
                : FutureBuilder(
                    future: Cat_Controller.Cat_Data_ApiCall(
                            Cat_Controller.Categories![selectedIndex]),
                    builder: (context, snapshot) {
                      return ListView(
                        children: [
                          Column(children: [
                            SizedBox(
                              height: 7,
                            ),
                            CarouselSlider(
                                items: [
                                  //1st Image of Slider
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image:
                                            AssetImage("Assets/Perfume_ad.jpg"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),

                                  //2nd Image of Slider
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image:
                                            AssetImage("Assets/boat_watch.jpg"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),

                                  //3rd Image of Slider
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image:
                                            AssetImage("Assets/lloreal_ad.jpg"),
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
                                  autoPlayCurve: Curves.easeInOutSine,
                                  enableInfiniteScroll: true,
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 700),
                                  viewportFraction: 0.8,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: Cat_Controller.Categories!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                        printSelectedCategory();
                                      },
                                      child: Chip(
                                        label: Text(
                                            Cat_Controller.Categories![index]),
                                        padding: EdgeInsets.zero,
                                        labelStyle: GoogleFonts.roboto(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: selectedIndex == index
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        backgroundColor: selectedIndex == index
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Cat_Controller.Categories_Data!.isEmpty
                                ? Container(
                                    height: 410,
                                    width: double.infinity,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  )
                                :  GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    itemCount:
                                        Cat_Controller.Categories_Data!.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 1,
                                      crossAxisSpacing: 1,
                                      childAspectRatio: 0.59,
                                    ),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Cat_Controller.Product_Id(
                                              Cat_Controller.Categories_Data![index]['id'],
                                            Cat_Controller.Categories_Data![index]['description'],);
                                          print(Cat_Controller.Categories_Data![index]['id']);
                                          Navigator.push(context, MaterialPageRoute(
                                            builder: (context) {
                                              return Cat_Product_View();
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
                                                          Cat_Controller
                                                                  .Categories_Data![
                                                              index]['images'][0]),
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                              Container(
                                                height: 100,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10,
                                                      vertical: 7),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        Cat_Controller
                                                                .Categories_Data![
                                                            index]['title'],
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                      Text(
                                                        Cat_Controller
                                                                .Categories_Data![
                                                            index]['description'],
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.roboto(
                                                                color:
                                                                    Colors.grey,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "\$ " +
                                                                Cat_Controller
                                                                    .Categories_Data![
                                                                        index][
                                                                        'price']
                                                                    .toString(),
                                                            style: GoogleFonts.roboto(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        150,
                                                                        10,
                                                                        10),
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            Cat_Controller
                                                                .Categories_Data![
                                                                    index]
                                                                    ['rating']
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        5,
                                                                        153,
                                                                        28),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
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
                          ]),
                        ],
                      );
                    },
                  );
          },
        ));
  }
}

// body: S_Controller.Cat_Images.isEmpty
//     ? Center(
//         child: CircularProgressIndicator(
//           color: Colors.blueAccent,
//         ),
//       )
//     : Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//
//             CarouselSlider(
//               items: [
//
//                 //1st Image of Slider
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8.0),
//                     image: DecorationImage(
//                       image: AssetImage("Assets/Perfume_ad.jpg"),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//
//                 //2nd Image of Slider
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8.0),
//                     image: DecorationImage(
//                       image: AssetImage("Assets/boat_watch.jpg"),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//
//                 //3rd Image of Slider
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8.0),
//                     image: DecorationImage(
//                       image: AssetImage("Assets/lloreal_ad.jpg"),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//
//               ],
//
//               options: CarouselOptions(
//                 height: 180.0,
//                 enlargeCenterPage: true,
//                 autoPlay: true,
//                 aspectRatio: 16 / 9,
//                 autoPlayCurve: Curves.easeInOutSine,
//                 enableInfiniteScroll: true,
//                 autoPlayAnimationDuration: Duration(milliseconds: 800),
//                 viewportFraction: 0.8,
//               ),
//             ),
//             GetBuilder<Home_control>(
//               builder: (value) {
//                 return Expanded(
//                   child: ListView.builder(
//                     padding: EdgeInsets.only(bottom: 15),
//                     itemCount: value.Category_type.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.only(top: 20),
//                         child: InkWell(
//                           onTap: () {
//                             value.Category_Index(index);
//                             Navigator.push(context,
//                                 MaterialPageRoute(builder: (context) {
//                               return Categories_Screen(
//                                 Category: value.Category_type[index],
//                               );
//                             }));
//                           },
//                           child: Container(
//                             height: 110,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Colors.white,
//                             ),
//                             child: Row(
//                               crossAxisAlignment:
//                                   CrossAxisAlignment.center,
//                               children: [
//                                 SizedBox(width: 20),
//                                 Text(
//                                   value.Category_type[index],
//                                   style: GoogleFonts.roboto(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Container(
//                                   height: 120,
//                                   width: 155,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.only(
//                                       topRight: Radius.circular(10),
//                                       bottomRight: Radius.circular(10),
//                                     ),
//                                     image: DecorationImage(
//                                       image: NetworkImage(
//                                         value.Cat_Images[index],
//                                       ),
//                                       fit: BoxFit.fill,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             )
//           ],
//         ),
//       ),
