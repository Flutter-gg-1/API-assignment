import 'package:flutter/material.dart';

class OtherDetailsWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const OtherDetailsWidget({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.white70,),
        const SizedBox(width: 5,),
        Text(text,style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
      ],
    );
  }
}