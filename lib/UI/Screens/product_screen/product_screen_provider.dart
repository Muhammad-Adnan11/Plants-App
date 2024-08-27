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
      "image": "assets/images/logo.jpeg",
      "title": "name",
      "icon": Icons.favorite,
      "icons": Icons.favorite_border,
      "subtitle": "price",
      "carticon": Icons.add,
    },
    {
      "image": "assets/images/plants2.jpeg",
      "title": "name",
      "icon": Icons.favorite,
      "icons": Icons.favorite_border,
      "subtitle": "price",
      "carticon": Icons.add,
    },
    {
      "image": "assets/images/plants3.jpeg",
      "title": "name",
      "icon": Icons.favorite,
      "icons": Icons.favorite_border,
      "subtitle": "price",
      "carticon": Icons.add,
    },
    {
      "image": "assets/images/plants4.jpeg",
      "title": "name",
      "icon": Icons.favorite,
      "icons": Icons.favorite_border,
      "subtitle": "price",
      "carticon": Icons.add,
    },
    {
      "image": "assets/images/plants5.jpeg",
      "title": "name",
      "icon": Icons.favorite,
      "icons": Icons.favorite_border,
      "subtitle": "price",
      "carticon": Icons.add,
    },
    {
      "image": "assets/images/plants6.jpeg",
      "title": "name",
      "icon": Icons.favorite,
      "icons": Icons.favorite_border,
      "subtitle": "price",
      "carticon": Icons.add,
    },
    {
      "image": "assets/images/plants7.jpeg",
      "title": "adnan",
      "icon": Icons.favorite,
      "icons": Icons.favorite_border,
      "subtitle": "price",
      "carticon": Icons.add,
    },
    {
      "image": "assets/images/plants1.jpeg",
      "title": "name",
      "icon": Icons.favorite,
      "icons": Icons.favorite_border,
      "subtitle": "price",
      "carticon": Icons.add,
    },
  ];
}
