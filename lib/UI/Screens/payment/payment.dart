import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Out'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: heigthX * 0.25,
              child: PageView(
                controller: PageController(
                  initialPage: 0,
                ),
                children: [
                  Image.asset('assets/images/card.jpeg'),
                  Image.asset('assets/images/card1.png'),
                  Image.asset('assets/images/card2.png'),
                  Image.asset('assets/images/card3.jpeg'),
                  Image.asset('assets/images/card4.jpeg'),
                  Image.asset('assets/images/card5.jpeg'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 19, right: 150),
              child: Text(
                'Add new card',
                style: TextStyle(fontSize: heigthX * 0.04, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
