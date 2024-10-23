import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:plants_mart/UI/Components/custom_container.dart';
import 'package:plants_mart/UI/Screens/payment/Payment_stripe.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    var heigthX = MediaQuery.of(context).size.height;
    var widthy = MediaQuery.of(context).size.width;
    PaymentStripe pay = PaymentStripe();
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Out'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: heigthX * 0.2,
              child: CarouselSlider.builder(
                itemCount: pay.imgList.length,
                itemBuilder: (context, index, realIndex) {
                  return Image.asset(
                    pay.imgList[index],
                    fit: BoxFit.cover,
                    width: widthy * 0.8,
                    //height: 1,
                  );
                },
                options: CarouselOptions(
                  autoPlay: true, // Enable auto-slide
                  autoPlayInterval: Duration(seconds: 3), // Set auto-slide interval
                  enlargeCenterPage: true, // Enlarge the center page
                  enlargeFactor: 0.3, // Control the enlargement factor of the center image
                  aspectRatio: 2.0, // Aspect ratio of the carousel
                  viewportFraction: 0.8,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 19, right: 170),
              child: Text(
                'Add new card',
                style: TextStyle(fontSize: heigthX * 0.04, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                CustomIconContainer(imageUrl: 'assets/images/appleicon.png'),
                SizedBox(
                  width: widthy * 0.02,
                ),
                CustomIconContainer(imageUrl: 'assets/images/googleicon.png'),
                SizedBox(
                  width: widthy * 0.02,
                ),
                CustomIconContainer(imageUrl: 'assets/images/paypalicon.png'),
                SizedBox(
                  width: widthy * 0.02,
                ),
                CustomIconContainer(imageUrl: 'assets/images/mastercardicon.png'),
              ],
            ),
            Row(
              children: [
                Text('Apple'),
                SizedBox(
                  width: widthy * 0.04,
                ),
                Text('Google'),
                SizedBox(
                  width: widthy * 0.04,
                ),
                Text('Pay pal'),
                SizedBox(
                  width: widthy * 0.02,
                ),
                Text('Master card'),
                SizedBox(
                  width: widthy * 0.02,
                ),
              ],
            ),
            SizedBox(
              height: heigthX * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 230),
              child: Text(
                'Card Holder',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: heigthX * 0.03),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: TextField(
                //cursorHeight: heigthX * 0.04,
                decoration: InputDecoration(
                  hintText: 'enter your name',
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.green, width: widthy * 0.005),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: Text(
                'Card Number',
                style: TextStyle(fontSize: heigthX * 0.03, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'abc',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 1)),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text('Expire date'),
                    Container(
                      height: heigthX * 0.01,
                      width: widthy * 0.01,
                      color: Colors.amber,
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.amber,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            MaterialButton(
              onPressed: () async {
                await pay.makePayment(context);
              },
              minWidth: widthy * 0.6,
              //height: heigthX * 0.01,
              color: Color(0XFF67802f),
              child: Text(
                'Payment',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
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
