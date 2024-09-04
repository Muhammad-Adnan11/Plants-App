import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:plants_mart/UI/Screens/product_screen/product_screen.dart';
import 'package:plants_mart/UI/Screens/product_screen/product_screen_provider.dart';

class Buttomnavigation extends StatefulWidget {
  const Buttomnavigation({super.key});

  @override
  State<Buttomnavigation> createState() => _ButtomnavigationState();
}

class _ButtomnavigationState extends State<Buttomnavigation> {
  List<Widget> screens=[
    const ProductScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    Productlist bott=Productlist();
    return Scaffold(
      bottomNavigationBar:  Container(
        child: BottomBarInspiredOutside(
          items: bott.items,
          backgroundColor: Colors.white,
          color: Colors.green,
          colorSelected: Colors.white,
          indexSelected: bott.stateindex,
          onTap: (int index) => setState(() {
            bott.stateindex = index;
          }),
          top: -28,
          animated: false,
          itemStyle: ItemStyle.circle,
          chipStyle:
          const ChipStyle(notchSmoothness: NotchSmoothness.smoothEdge, background: Colors.green),
        ),
      ),
    );
  }
}
