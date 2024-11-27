import 'package:flutter/cupertino.dart';

class Custom_Row1 extends StatelessWidget {
  Custom_Row1({
    super.key,
    required this.text,
    required this.icon,
  });

  String text;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 15,
          ),
          Text(text,style: const TextStyle(
            fontSize: 16,
          ),),
        ],
      ),
    );
  }
}