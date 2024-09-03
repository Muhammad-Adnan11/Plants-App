import 'package:flutter/material.dart';
import 'package:plants_mart/Generated/assets/assets_url.dart';

class DetailScreen extends StatefulWidget {

  String imageUrl;
  String name;
  String descrption;
  String price;


   DetailScreen({super.key,required this.imageUrl,required this.name,required this.descrption,required this.price});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 30),
              child: Image.asset(Nicepic.plantsiamge),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  Container(

                    margin: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      Nicepic.plantsimage1,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      Nicepic.plantsiamge,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  Image.asset(
                    Nicepic.plantsimage1,
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
            ),

               Text(
                'Rosemary Plant',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),

      Text('Could you please clarify what specific details about plants youre looking for? Are you interested in types of plants, their care, benefits, or something else? Let me know so I can provide the most relevant information!'),
           SizedBox(height: 10,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
             Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Text('price'),
                 Text('\$40.00',style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                 ),
                 ),
               ],
             ),
               Container(

                 height: 40,
                 width: 180,
                 decoration: BoxDecoration(
                   color: Color(0XFF67802f),
                   borderRadius: BorderRadius.circular(12)
                 ),
                 child: Row(mainAxisAlignment: MainAxisAlignment.center
                   ,
                   children: [Icon(Icons.shopping_cart,color: Color(0XFFffffff),),
                 SizedBox(width: 20,),
                 Text('Add to Cart',style: TextStyle(color: Color(0XFFffffff),
                 ),
                 ),
                   ],
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
          child: Icon(
            Icons.sunny,
            color: Colors.yellow,
          ),
        ),
        title: Text(property, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}
