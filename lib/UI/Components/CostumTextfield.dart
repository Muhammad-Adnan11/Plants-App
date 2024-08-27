import 'package:flutter/material.dart';

class CostumTextfield extends StatelessWidget {
  final Widget? suffix;
  final String lableText;
  final String hintText;
  final IconData? icon;
  final TextEditingController controller;
  final bool isPassword;
  CostumTextfield({required this.lableText, required this.hintText, required this.controller, required this.icon, this.isPassword = false, this.suffix});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        right: 30,
        left: 30,
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          suffix: suffix,
          hintText: hintText,
          labelText: lableText,
          prefixIcon: icon != null ? Icon(icon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
