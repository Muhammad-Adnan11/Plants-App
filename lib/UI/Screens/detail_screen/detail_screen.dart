import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plants_mart/Generated/assets/assets_url.dart';
import 'package:plants_mart/UI/Screens/cart_screen/cart_screen.dart';

class DetailScreen extends StatefulWidget {
  String imageUrl;
  String name;
  String descrption;
  String price;

  DetailScreen({super.key, required this.imageUrl, required this.name, required this.descrption, required this.price});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 30),
              child: Image.network(widget.imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      Nicepic.plantsimage1,
                      height: height * 0.1,
                      width: width * 0.14,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      Nicepic.plantsiamge,
                      height: height * 0.1,
                      width: width * 0.14,
                    ),
                  ),
                  Image.asset(
                    Nicepic.plantsimage1,
                    height: height * 0.1,
                    width: width * 0.14,
                  ),
                ],
              ),
            ),
            Text(
              widget.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                plantProperties("Sunlight", "20-30%"),
                plantProperties("Humadit", "20-30%"),
              ],
            ),
            Text(
              'Description',
              style: TextStyle(fontSize: width * 0.07, fontWeight: FontWeight.bold),
            ),
            Text(widget.descrption),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('price'),
                    Text(
                      widget.price.toString(),
                      style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: height * 0.06,
                  width: width * 0.5,
                  decoration: BoxDecoration(color: const Color(0XFF67802f), borderRadius: BorderRadius.circular(12)),
                  child: InkWell(
                    onTap: () {
                      FirebaseFirestore.instance.collection('cart data').doc().set({
                        'imageUrl': widget.imageUrl,
                        'name': widget.name,
                        //'price': int.tryParse(widget.price) ?? 2, // i am changes this line
                        'price': int.tryParse(widget.price.toString())??widget.price,
                        'quantity': 1,
                        'userid': FirebaseAuth.instance.currentUser!.uid,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Center(
                            child: Text(
                              'Item added in cart',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          backgroundColor: const Color(0XFF67802f),
                          duration: const Duration(seconds: 3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // Set border radius
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.shopping_cart,
                          color: Color(0XFFffffff),
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => CartScreen()));
                        //   },
                        //   child:

                        const Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Color(0XFFffffff),
                          ),
                        ),
                        //),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Flexible plantProperties(String property, String value) {
    return Flexible(
      flex: 1,
      child: ListTile(
        leading: Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.2), spreadRadius: 1)
          ]),
          child: const Icon(
            Icons.sunny,
            color: Colors.yellow,
          ),
        ),
        title: Text(property, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}
