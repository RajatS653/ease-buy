import 'package:ease_buy/Controllers/Home_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Bag_Screen extends StatefulWidget {
  const Bag_Screen({super.key});

  @override
  State<Bag_Screen> createState() => _Bag_ScreenState();
}

class _Bag_ScreenState extends State<Bag_Screen> {
  final B_Controller = Get.put(Home_control());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 181, 180, 180),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100,),
                  Text("My Bag", style: GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.w800),),
                  GetBuilder<Home_control>(builder: (value) {
                    return Expanded(
                      child: Text("not yet"),
                    );


                  },)

                ],
              ),
            ),

    );

  }
}
