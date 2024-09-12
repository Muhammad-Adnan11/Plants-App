import 'package:flutter/cupertino.dart';

class TitleAndPrice extends StatelessWidget {
  final String title;
  final String price;
  TitleAndPrice({
    required this.title,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(price),
      ],
    );
  }
}