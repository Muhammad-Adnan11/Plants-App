import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:flutter/material.dart';

class Productlist with ChangeNotifier {
  int stateindex = 0;
  List<TabItem> items = [
    TabItem(
      icon: Icons.home,
      // title: 'Home',
    ),
    TabItem(
      icon: Icons.search_sharp,
      title: 'Shop',
    ),
    TabItem(
      icon: Icons.favorite_border,
      title: 'Wishlist',
    ),
    TabItem(
      icon: Icons.shopping_cart_outlined,
      title: 'Cart',
    ),
    TabItem(
      icon: Icons.account_box,
      title: 'profile',
    ),
  ];
  List<Map<String, dynamic>> plantlist = [
    {
      "image": "assets/images/plants14.jpeg",
      "title": "Succulent",
      "icon": Icons.favorite,
      "icons": Icons.favorite_border,
      "subtitle": "900",
      "carticon": Icons.add,
    },
    {
      "image": "assets/images/plants10.jpeg",
      "title": "name",
      "icon": Icons.favorite,
      "icons": Icons.favorite_border,
      "subtitle": "price",
      "carticon": Icons.add,
    },
    {
      "image": "assets/images/plants11.jpeg",
      "title": "name",
      "icon": Icons.favorite,
      "icons": Icons.favorite_border,
      "subtitle": "price",
      "carticon": Icons.add,
    },
    {
      "image": "assets/images/plants12.jpeg",
      "title": "name",
      "icon": Icons.favorite,
      "icons": Icons.favorite_border,
      "subtitle": "price",
      "carticon": Icons.add,
    },
    {
      "image": "assets/images/plants13.jpeg",
      "title": "weed",
      "icon": Icons.favorite,
      "icons": Icons.favorite_border,
      "subtitle": "344",
      "carticon": Icons.add,
    },
    {
      "image": "assets/images/plants18.jpeg",
      "title": "Fern",
      "icon": Icons.favorite,
      "icons": Icons.favorite_border,
      "subtitle": "112",
      "carticon": Icons.add,
    },
    {
      "image": "assets/images/plants17.jpeg",
      "title": "plants",
      "icon": Icons.favorite,
      "icons": Icons.favorite_border,
      "subtitle": "price",
      "carticon": Icons.add,
    },
    {
      "image": "assets/images/plants8.jpeg",
      "title": "name",
      "icon": Icons.favorite,
      "icons": Icons.favorite_border,
      "subtitle": "price",
      "carticon": Icons.add,
    },
  ];
}
