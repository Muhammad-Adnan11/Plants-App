import 'package:flutter/material.dart';
import 'package:plants_mart/Generated/assets/assets_url.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 70),
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
                    height: 100,
                    width: 50,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    Nicepic.plantsiamge,
                    height: 100,
                    width: 50,
                  ),
                ),
                Image.asset(
                  Nicepic.plantsimage1,
                  height: 100,
                  width: 50,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              'Rosemary Plant',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              plantProperties("Sunlight", "20-30%"),
              plantProperties("Humadity", "20-30%"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Description',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          )
        ],
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
