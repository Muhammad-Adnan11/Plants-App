import 'package:flutter/material.dart';
import 'package:plants_mart/UI/Components/costum_divider_screen.dart';
import 'package:plants_mart/core/colors.dart';

class CheckoutScreen extends StatefulWidget {
  List<int>? priceList;
  List<int>? quantityList;
   CheckoutScreen({super.key, this.priceList, this.quantityList});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
print(widget.priceList.toString());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("Checkout Now", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 30,),
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
            height: height * 0.01,
          ),
          Container(
            height: height * 0.22,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  TitleAndPrice(
                    title: 'SubTotal:',
                    price: 'subtotal.toString()',
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
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (_)=>AdmainScreen()));
            },
            color: Color(0XFF67802f),
            child: Text('checkOut'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ],),
      ),
    );
  }
}
