import 'package:flutter/material.dart';

class CostumTextfield extends StatelessWidget {
  final Widget? suffix;
  final Widget? icons;
  final String lableText;
  final String hintText;
  final IconData? icon;
  final TextEditingController controller;
  final bool isPassword;
  CostumTextfield({required this.lableText, required this.hintText, required this.controller, this.icon, this.isPassword = false, this.suffix,this.icons});

  @override
  Widget build(BuildContext context) {
    var heightx = MediaQuery.of(context).size.height;
    var wigthx = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        right: 30,
        left: 30,
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          suffix: suffix,
          hintText: hintText,
          labelText: lableText,
          labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          prefixIcon: icon != null ? Icon(icon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0XFF67802f), width: wigthx * 0.005),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Color(0XFF67802f),
              width: wigthx * 0.005,
            ),
          ),
        ),
      ),
    );
  }
}
