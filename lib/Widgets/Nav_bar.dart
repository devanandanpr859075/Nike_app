// lib/widgets/bottom_nav.dart
import 'package:flutter/material.dart';
import 'package:nike_ecom/views/FavouritesView.dart';
import 'package:nike_ecom/views/Shop_Screen.dart';
import 'package:nike_ecom/views/bag_view.dart';
import 'package:nike_ecom/views/home_screen.dart';
import 'package:nike_ecom/views/profile_view.dart';
// import '../view/home_screen.dart';
// import '../view/shop_screen.dart';
// import '../view/favourites_screen.dart';
// import '../view/bag_screen.dart';
// import '../view/profile_screen.dart';

class BottomNavWrapper extends StatefulWidget {
  const BottomNavWrapper({super.key});

  @override
  State<BottomNavWrapper> createState() => _BottomNavWrapperState();
}

class _BottomNavWrapperState extends State<BottomNavWrapper> {
  int currentIndex = 0;

  final screens = [
    const HomeScreen(),
    const ShopScreen(),
    FavouritesView(),
    BagView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.storefront_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}
