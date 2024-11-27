import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:plants_mart/UI/Screens/product_screen/product_screen.dart';
import 'package:plants_mart/UI/Screens/product_screen/product_screen_provider.dart';
import 'package:plants_mart/UI/Screens/profile_screen/profile_screen.dart';

import 'cart_screen/cart_screen.dart';

class Buttomnavigation extends StatefulWidget {
  const Buttomnavigation({super.key});

  @override
  State<Buttomnavigation> createState() => _ButtomnavigationState();
}

class _ButtomnavigationState extends State<Buttomnavigation> {
  List<Widget> screens = [
    const ProductScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  int selectscreen = 0;
  @override
  Widget build(BuildContext context) {
    Productlist bott = Productlist();
    return Scaffold(
      body: screens[selectscreen],
      bottomNavigationBar: Container(
        child: BottomBarInspiredOutside(
          items: bott.items,
          backgroundColor: Colors.white,
          color: const Color(0XFF67802f),
          colorSelected: Colors.white,
          indexSelected: selectscreen,
          onTap: (int index) => setState(() {
            selectscreen = index;
          }),
          top: -28,
          animated: false,
          itemStyle: ItemStyle.circle,
          chipStyle: const ChipStyle(notchSmoothness: NotchSmoothness.smoothEdge, background: Color(0XFF67802f)),
        ),
      ),
    );
  }
}
