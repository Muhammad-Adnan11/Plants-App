import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plants_mart/Core/Colors.dart';
import 'package:plants_mart/Generated/assets/assets_url.dart';

import '../../Components/costum_divider_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
        padding: const EdgeInsets.only(left: 25, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Order list: 3 items'),
            Container(
              height: height * 0.47,
              child: ListView.builder(
                  itemExtent: 100,
                  itemCount: 3,
                  itemBuilder: (context, Index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        height: height * 0.1,
                        width: width * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0XFFffffff)),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                height: height * 0.12,
                                width: width * 0.22,
                                decoration: BoxDecoration(
                                    color: Color(0XFFefefef),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Image.asset(Nicepic.plantsiamge),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Bard of paradise',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: width * 0.03,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '59.99',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                Container(
                                  width: width * 0.28,
                                  height: height * 0.04,
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
                                        height: height * 0.03,
                                        width: width * 0.05,
                                        color: Color(0XFF67802f),
                                        child: Icon(
                                          Icons.remove,
                                          size: 18,
                                          color: Color(0XFFefefef),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width *0.02,
                                      ),
                                      Text(
                                        '1',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        height: height * 0.03,
                                        width: width * 0.05,
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
                                      height: height * 0.04,
                                      width: width *0.22,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Color(0XFF67802f),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        'Check out',
                                        style:
                                            TextStyle(color: Color(0XFFffffff)),
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
            ),
            Container(
              height: height * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0XFFffffff),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Promo code',
                      style: TextStyle(color: Colors.grey),
                    ),
                    // MaterialButton(onPressed: (){},
                    //   color: Colors.green,
                    //   height: 30,
                    // )
                    Container(
                      alignment: Alignment.center,
                      height: height * 0.05,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19),
                        color: Color(0XFF67802f),
                      ),
                      child: Text(
                        'Apply',
                        style: TextStyle(color: Appcolor.thridecolor),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height *0.01,
            ),
            Container(
              height: height * 0.22,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    TitleAndPrice(
                      title: 'SubTotal:',
                      price: '\$100',
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    TitleAndPrice(
                      title: 'Tax:',
                      price: '\$15',
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    TitleAndPrice(
                      title: 'Delivery Fee:',
                      price: '\$5',
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    TitleAndPrice(
                      title: 'Total Amount',
                      price: '\$120',
                    ),
                  ],
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              color: Color(0XFF67802f),
              child: Text('checkOut'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


