import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:plants_mart/UI/Components/custom_container.dart';

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
   Map<String, dynamic>? paymentIntentData;
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: heigthX * 0.2,
              child: CarouselSlider.builder(
                itemCount: imgList.length,
                itemBuilder: (context, index, realIndex) {
                  return Image.asset(
                    imgList[index],
                    fit: BoxFit.cover,
                    width: widthy * 0.8,
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
            MaterialButton(
              onPressed: () {},
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
   Future<void> makePayment() async {
    try {
      paymentIntentData =
          await createPaymentIntent('20', 'USD'); //json.decode(response.body);
      // print('Response body==>${response.body.toString()}');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  setupIntentClientSecret: 'Your Secret Key',
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  //applePay: PaymentSheetApplePay.,
                  //googlePay: true,
                  //testEnv: true,
                  customFlow: true,
                  style: ThemeMode.dark,
                  // merchantCountryCode: 'US',
                  merchantDisplayName: 'Kashif'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('Payment exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance
          .presentPaymentSheet(
              //       parameters: PresentPaymentSheetParameters(
              // clientSecret: paymentIntentData!['client_secret'],
              // confirmPayment: true,
              // )
              )
          .then((newValue) {
        print('payment intent' + paymentIntentData!['id'].toString());
        print(
            'payment intent' + paymentIntentData!['client_secret'].toString());
        print('payment intent' + paymentIntentData!['amount'].toString());
        print('payment intent' + paymentIntentData.toString());
        //orderPlaceApi(paymentIntentData!['id'].toString());
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("paid successfully")));

        paymentIntentData = null;
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer ' + 'your token',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
