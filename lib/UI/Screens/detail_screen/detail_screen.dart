import 'dart:ui';

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
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 65, top: 70),
            child: Container(
              child: Image.asset(Nicepic.plantsiamge),
            ),
          ),
          Row(
            children: [
              Container(
                child: Image.asset(
                  Nicepic.plantsimage1,
                  height: 100,
                  width: 50,
                ),
              ),
              Container(
                child: Image.asset(
                  Nicepic.plantsiamge,
                  height: 100,
                  width: 50,
                ),
                decoration: BoxDecoration(),
              ),
              Container(
                child: Image.asset(
                  Nicepic.plantsimage1,
                  height: 100,
                  width: 50,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
