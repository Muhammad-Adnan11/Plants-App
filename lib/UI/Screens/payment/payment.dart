import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  // List of image paths
  final List<String> imgList = [
    'assets/images/card.jpeg',
    'assets/images/card1.png',
    'assets/images/card2.png',
    'assets/images/card3.jpeg',
    'assets/images/card4.jpeg',
    'assets/images/card5.jpeg',
  ];
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
              child: CarouselSlider.builder(
                itemCount: imgList.length,
                itemBuilder: (context, index, realIndex) {
                  return Image.asset(
                    imgList[index],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
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
