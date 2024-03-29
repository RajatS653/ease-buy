// ignore_for_file: file_names

import 'package:ease_buy/Screens/Profile.dart';
import 'package:ease_buy/Screens/Bag.dart';
import 'package:ease_buy/Screens/Shop.dart';
import 'package:ease_buy/Screens/Home.dart';
import 'package:ease_buy/Screens/Favourites.dart';
import 'package:flutter/material.dart';


class AllScreen extends StatefulWidget {
  const AllScreen({super.key});

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  // ignore: non_constant_identifier_names
  int selected_index = 0;

  void OnTapped(int index) {
    setState(() {
      selected_index = index;
    });
  }

  // ignore: unused_field
  static List<Widget> screens = const [
    Home_Screen(),
    Shop_Screen(),
    Bag_Screen(),
    Favourites_Screen(),
    Profile_Screen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 55,
        width: double.infinity,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline,),
                label: "Favourites"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp),
                label: "Profile"),
          ],
          currentIndex: selected_index,
          selectedItemColor: Color.fromARGB(255, 150, 10, 10),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12,
          iconSize: 25,
          onTap: OnTapped,
        ),
      ),
      body: screens[selected_index],
    );
  }
}
