

import 'package:flutter/material.dart';

import 'Bag.dart';
import 'Favourites.dart';
import 'Home.dart';
import 'Profile.dart';
import 'Shop.dart';

class AllScreen extends StatefulWidget {
  final int index;
  const AllScreen({super.key, required this.index});

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.index; // Initialize selectedIndex with the index passed to AllScreen
  }

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static const List screens = [
    Home_Screen(),
    Shop_Screen(),
    Bag_Screen(),
    Favourites_Screen(),
    Profile_Screen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: selectedIndex,
        selectedItemColor: Color.fromARGB(255, 150, 10, 10),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        iconSize: 25,
        onTap: onTapped,
      ),
      body: screens[selectedIndex],
    );
  }
}

// Placeholder screens for the example
class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ),
      body: Center(
        child: Text('Shop Screen'),
      ),
    );
  }
}

class BagScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bag'),
      ),
      body: Center(
        child: Text('Bag Screen'),
      ),
    );
  }
}

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
      ),
      body: Center(
        child: Text('Favourites Screen'),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}
