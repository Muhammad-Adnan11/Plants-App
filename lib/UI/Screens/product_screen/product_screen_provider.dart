import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:flutter/material.dart';

class Productlist with ChangeNotifier {
  int stateindex = 0;
  List<TabItem> items = [
    TabItem(
      icon: Icons.home,
      // title: 'Home',
    ),
    // TabItem(
    //   icon: Icons.search_sharp,
    //   title: 'Shop',
    // ),

    TabItem(
      icon: Icons.favorite_border,
      title: 'Wishlist',
    ),
    TabItem(
      icon: Icons.account_circle,
      title: 'profile',
    ),
    TabItem(
      icon: Icons.shopping_cart_outlined,
      title: 'Cart',
    ),
  ];

  List<Map<String, dynamic>> plantsList = [
    {
      'title' : 'Popular',
      'list' : [
        {
          "image": "assets/images/plants14.jpeg",
          "title": "Succulent",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$900",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'

        },
        {
          "image": "assets/images/plants10.jpeg",
          "title": "Monstera",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$15.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants11.jpeg",
          "title": "Yucca",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$35.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants12.jpeg",
          "title": "Dracaema",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$100",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants13.jpeg",
          "title": "weed",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$344",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants18.jpeg",
          "title": "zucca",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$112",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants17.jpeg",
          "title": "Ficus",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$30.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants8.jpeg",
          "title": "Aloe",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$130",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
      ],
    },
    {
      'title' : 'Indoor',
      'list' : [
        {
          "image": "assets/images/plants14.jpeg",
          "title": "Succulent",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$900",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'

        },
        {
          "image": "assets/images/plants10.jpeg",
          "title": "Monstera",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$15.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants11.jpeg",
          "title": "Yucca",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$35.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants12.jpeg",
          "title": "Dracaema",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$100",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants13.jpeg",
          "title": "weed",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$344",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants18.jpeg",
          "title": "zucca",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$112",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants17.jpeg",
          "title": "Ficus",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$30.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants8.jpeg",
          "title": "Aloe",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$130",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
      ],
    },
    {
      'title' : 'Outdoor',
      'list' : [
        {
          "image": "assets/images/plants14.jpeg",
          "title": "Succulent",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$900",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'

        },
        {
          "image": "assets/images/plants10.jpeg",
          "title": "Monstera",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$15.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants11.jpeg",
          "title": "Yucca",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$35.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants12.jpeg",
          "title": "Dracaema",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$100",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants13.jpeg",
          "title": "weed",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$344",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants18.jpeg",
          "title": "zucca",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$112",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants17.jpeg",
          "title": "Ficus",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$30.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants8.jpeg",
          "title": "Aloe",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$130",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
      ],
    },
    {
      'title' : 'Fashion',
      'list' : [
        {
          "image": "assets/images/plants14.jpeg",
          "title": "Succulent",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$900",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'

        },
        {
          "image": "assets/images/plants10.jpeg",
          "title": "Monstera",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$15.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants11.jpeg",
          "title": "Yucca",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$35.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants12.jpeg",
          "title": "Dracaema",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$100",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants13.jpeg",
          "title": "weed",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$344",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants18.jpeg",
          "title": "zucca",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$112",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants17.jpeg",
          "title": "Ficus",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$30.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
        {
          "image": "assets/images/plants8.jpeg",
          "title": "Aloe",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$130",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
        },
      ],
    },
  ];



  // List<Map<String, dynamic>> plantlist = [
  //   {
  //     "image": "assets/images/plants14.jpeg",
  //     "title": "Succulent",
  //     "icon": Icons.favorite,
  //     "icons": Icons.favorite_border,
  //     "subtitle": "\$900",
  //     "carticon": Icons.add,
  //     "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
  //
  //   },
  //   {
  //     "image": "assets/images/plants10.jpeg",
  //     "title": "Monstera",
  //     "icon": Icons.favorite,
  //     "icons": Icons.favorite_border,
  //     "subtitle": "\$15.0",
  //     "carticon": Icons.add,
  //     "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
  //   },
  //   {
  //     "image": "assets/images/plants11.jpeg",
  //     "title": "Yucca",
  //     "icon": Icons.favorite,
  //     "icons": Icons.favorite_border,
  //     "subtitle": "\$35.0",
  //     "carticon": Icons.add,
  //     "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
  //   },
  //   {
  //     "image": "assets/images/plants12.jpeg",
  //     "title": "Dracaema",
  //     "icon": Icons.favorite,
  //     "icons": Icons.favorite_border,
  //     "subtitle": "\$100",
  //     "carticon": Icons.add,
  //     "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
  //   },
  //   {
  //     "image": "assets/images/plants13.jpeg",
  //     "title": "weed",
  //     "icon": Icons.favorite,
  //     "icons": Icons.favorite_border,
  //     "subtitle": "\$344",
  //     "carticon": Icons.add,
  //     "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
  //   },
  //   {
  //     "image": "assets/images/plants18.jpeg",
  //     "title": "zucca",
  //     "icon": Icons.favorite,
  //     "icons": Icons.favorite_border,
  //     "subtitle": "\$112",
  //     "carticon": Icons.add,
  //     "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
  //   },
  //   {
  //     "image": "assets/images/plants17.jpeg",
  //     "title": "Ficus",
  //     "icon": Icons.favorite,
  //     "icons": Icons.favorite_border,
  //     "subtitle": "\$30.0",
  //     "carticon": Icons.add,
  //     "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
  //   },
  //   {
  //     "image": "assets/images/plants8.jpeg",
  //     "title": "Aloe",
  //     "icon": Icons.favorite,
  //     "icons": Icons.favorite_border,
  //     "subtitle": "\$130",
  //     "carticon": Icons.add,
  //     "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. Here are some key details about the cannabis plant:'
  //   },
  // ];



  List<String> listcount = [
    'popular',
    'indoor',
    'outdoor',
    'popular',
    'plants'
  ];
  int _index = 0;
  int get index => _index;
  void setCat(int index) {
    _index = index;

    notifyListeners();
  }
}
