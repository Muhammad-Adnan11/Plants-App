import 'package:flutter/material.dart';

class CustomIconContainer extends StatelessWidget {
  final IconData? icon; // Accepts an icon
  final Color? color;
  final String? imageUrl; // Accepts a color

  // Constructor to accept icon and color
  const CustomIconContainer({
    super.key,
    this.icon,
    this.color,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    var heigthX = MediaQuery.of(context).size.height;
    var widthy = MediaQuery.of(context).size.width;
    return Container(
      width: widthy * 0.13,
      height: heigthX * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: color,
      ),
      child: Image.asset(imageUrl!),
    );
  }
}
