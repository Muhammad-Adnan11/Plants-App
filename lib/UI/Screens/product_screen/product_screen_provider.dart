import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Productlist with ChangeNotifier {
  int stateindex = 0;
  List<TabItem> items = [
    const TabItem(
      icon: Icons.home,
      // title: 'Home',
    ),
    // TabItem(
    //   icon: Icons.favorite_border,
    //   title: 'Wishlist',
    // ),
    const TabItem(
      icon: Icons.shopping_cart_outlined,
      title: 'Cart',
    ),
    const TabItem(
      icon: Icons.account_circle,
      title: 'profile',
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
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'

        },
        {
          "image": "assets/images/plants10.jpeg",
          "title": "Monstera",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$15.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants11.jpeg",
          "title": "Yucca",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$35.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants12.jpeg",
          "title": "Dracaema",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$100",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants13.jpeg",
          "title": "weed",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$344",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants18.jpeg",
          "title": "zucca",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$112",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. '
        },
        {
          "image": "assets/images/plants17.jpeg",
          "title": "Ficus",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$30.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants8.jpeg",
          "title": "Aloe",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$130",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
      ],
    },
    {
      'title' : 'Indoor',
      'list' : [
        {
          "image": "assets/images/plants50.png",
          "title": "Succulent",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$900",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. '

        },
        {
          "image": "assets/images/plants22.png",
          "title": "Monstera",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$15.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants23.png",
          "title": "Yucca",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$35.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants24.png",
          "title": "Dracaema",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$100",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants25.png",
          "title": "weed",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$344",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants54.png",
          "title": "zucca",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$112",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. '
        },
        {
          "image": "assets/images/plants27.png",
          "title": "Ficus",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$30.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants28.png",
          "title": "Aloe",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$130",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. '
        },
      ],
    },
    {
      'title' : 'Outdoor',
      'list' : [
        {
          "image": "assets/images/plants54.png",
          "title": "Succulent",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$900",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'

        },
        {
          "image": "assets/images/plants55.png",
          "title": "Monstera",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$15.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. '
        },
        {
          "image": "assets/images/plants31.png",
          "title": "Yucca",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$35.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants32.png",
          "title": "Dracaema",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$100",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants33.png",
          "title": "weed",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$344",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants51.png",
          "title": "zucca",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$112",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants52.png",
          "title": "Ficus",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$30.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants54.png",
          "title": "Aloe",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$130",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years. '
        },
      ],
    },
    {
      'title' : 'Fashion',
      'list' : [
        {
          "image": "assets/images/plants49.png",
          "title": "Succulent",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$900",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'

        },
        {
          "image": "assets/images/plants47.png",
          "title": "Monstera",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$15.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants48.png",
          "title": "Yucca",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$35.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants40.png",
          "title": "Dracaema",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$100",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants41.png",
          "title": "weed",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$344",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants42.png",
          "title": "zucca",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$112",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants43.png",
          "title": "Ficus",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$30.0",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
        },
        {
          "image": "assets/images/plants44.png",
          "title": "Aloe",
          "icon": Icons.favorite,
          "icons": Icons.favorite_border,
          "subtitle": "\$130",
          "carticon": Icons.add,
          "description": 'A weed plant, specifically referring to cannabis (Cannabis sativa), is a tall, hardy plant that has been cultivated for various purposes over thousands of years.'
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
  void delet(int index,String id){
    switch(index){
      case 0:
         FirebaseFirestore.instance.collection('popular').doc(id).delete();
             break;
      case 1:
        FirebaseFirestore.instance.collection('indoor').doc(id).delete();
        break;
      case 2:
        FirebaseFirestore.instance.collection('outdoor').doc(id).delete();
        break;
      case 3:
        FirebaseFirestore.instance.collection('fashion').doc(id).delete();
        break;
      default:
        FirebaseFirestore.instance.collection('default').doc(id).delete();// Replace with your collection name
    }
  }
  Stream<QuerySnapshot> count(int index){
    switch(index){
     case 0:
       return FirebaseFirestore.instance.collection('popular').snapshots();
       break;
      case 1:
        return FirebaseFirestore.instance.collection('indoor').snapshots();
        break;
      case 2:
        return FirebaseFirestore.instance.collection('outdoor').snapshots();
        break;
      case 3:
        return FirebaseFirestore.instance.collection('fashion').snapshots();
        break;
      default:
        return FirebaseFirestore.instance.collection('default').snapshots();
    }
  }
}
