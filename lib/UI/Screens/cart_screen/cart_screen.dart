import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plants_mart/Generated/assets/assets_url.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFe7e7e7),
      appBar: AppBar(
        backgroundColor: Color(0XFFe7e7e7),
        title: Text(
          'Cart',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            Text('Order list: 3 items'),
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, Index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        height: 100,
                        width: 300,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0XFFffffff)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                height: 90,
                                width: 100,
                                decoration: BoxDecoration(color: Color(0XFFefefef), borderRadius: BorderRadius.circular(12)),
                                child: Image.asset(Nicepic.plantsiamge),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Bard of paradise',
                                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '59.99',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0XFFe7e7e7),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete),
                                      Text('Remove')
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30, top: 8),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 18,
                                        width: 18,
                                        color: Color(0XFF67802f),
                                        child: Icon(
                                          Icons.add,
                                          size: 18,
                                          color: Color(0XFFefefef),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '1',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        height: 18,
                                        width: 18,
                                        color: Color(0XFF67802f),
                                        child: Icon(
                                          Icons.add,
                                          size: 18,
                                          color: Color(0XFFffffff),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 27),
                                    child: Container(
                                      height: 29,
                                      width: 80,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Color(0XFF67802f),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        'Check out',
                                        style: TextStyle(color: Color(0XFFffffff)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
