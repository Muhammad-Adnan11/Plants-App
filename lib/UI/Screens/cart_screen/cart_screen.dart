import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plants_mart/Core/Colors.dart';
import 'package:plants_mart/Generated/assets/assets_url.dart';
import 'package:plants_mart/UI/Screens/admain_screen/admain_screen.dart';
import 'package:plants_mart/UI/Screens/payment/payment.dart';

import '../../Components/costum_divider_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int tax = 0;
  int deliveryfee = 0;
  int totalAmount = 0;
  int subtotal = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0XFFe7e7e7),
      appBar: AppBar(
        backgroundColor: const Color(0XFFe7e7e7),
        title: const Text(
          'Cart',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Order list: 3 items'),
              SizedBox(
                height: height * 0.47,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('cart data').where('userid', isEqualTo: FirebaseAuth.instance.currentUser?.uid).snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      // Check for errors or connection state
                      if (snapshot.hasError) {
                        return Center(child: Text("Error: ${snapshot.error}"));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      subtotal = 0;
                      return ListView.builder(
                          itemExtent: 100,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            // int quantity = snapshot.data!.docs[index]['quantity'];
                            // int price = snapshot.data!.docs[index]['price'];
                            // int itemTotal = quantity * price;
                            // subtotal += itemTotal;
                            int quantity = int.tryParse(snapshot.data!.docs[index]['quantity'].toString()) ?? 0; // Convert to int
                            int price = int.tryParse(snapshot.data!.docs[index]['price'].toString()) ?? 0; // Convert to int
                            int itemTotal = quantity * price;
                            subtotal += itemTotal;

                            print("Price is $price, Quantity is $quantity, and Item Total is $itemTotal");
                            print("Subtotal is $subtotal");
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                height: height * 0.1,
                                width: width * 0.1,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0XFFffffff)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: Container(
                                        height: height * 0.12,
                                        width: width * 0.22,
                                        decoration: BoxDecoration(color: const Color(0XFFefefef), borderRadius: BorderRadius.circular(12)),
                                        child: Image.network(snapshot.data!.docs[index]['imageUrl']),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          // 'Bard of paradise',
                                          snapshot.data!.docs[index]['name'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: width * 0.03, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          // '59.99',
                                          price.toString(),
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            await FirebaseFirestore.instance.collection('cart data').doc(snapshot.data!.docs[index].id).delete();
                                          },
                                          child: Container(
                                            width: width * 0.28,
                                            height: height * 0.04,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: const Color(0XFFe7e7e7),
                                            ),
                                            child: const Row(
                                              children: [
                                                Icon(Icons.delete),
                                                Text('Remove')
                                              ],
                                            ),
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
                                              InkWell(
                                                onTap: () {
                                                  int counting = quantity == 1 ? 1 : quantity - 1;
                                                  FirebaseFirestore.instance.collection('cart data').doc(snapshot.data!.docs[index].id).update({
                                                    'quantity': counting
                                                  }).then((_) {
                                                    print("Quantity updated");
                                                  });
                                                },
                                                child: Container(
                                                  height: height * 0.03,
                                                  width: width * 0.05,
                                                  color: const Color(0XFF67802f),
                                                  child: const Icon(
                                                    Icons.remove,
                                                    size: 18,
                                                    color: Color(0XFFefefef),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.02,
                                              ),
                                              Text(
                                                quantity.toString(),
                                                style: const TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  int counting = quantity + 1;
                                                  FirebaseFirestore.instance.collection('cart data').doc(snapshot.data!.docs[index].id).update({
                                                    'quantity': counting
                                                  }).then((_) {
                                                    print("Quantity updated");
                                                  });
                                                },
                                                child: Container(
                                                  height: height * 0.03,
                                                  width: width * 0.05,
                                                  color: const Color(0XFF67802f),
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 18,
                                                    color: Color(0XFFffffff),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
              ),
              Container(
                height: height * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0XFFffffff),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
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
                          color: const Color(0XFF67802f),
                        ),
                        child: const Text(
                          'Apply',
                          style: TextStyle(color: Appcolor.thridecolor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height * 0.22,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      TitleAndPrice(
                        title: 'SubTotal:',
                        price: subtotal.toString(),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      TitleAndPrice(
                        title: 'Tax:',
                        price: '\$ $subtotal',
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      TitleAndPrice(
                        title: 'Delivery Fee:',
                        price: '\$5',
                      ),
                      const Divider(
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
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const Payment()));
                },
                color: const Color(0XFF67802f),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'checkOut',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
