


import 'package:flutter/material.dart';

class UserDataWidget extends StatelessWidget {
  const UserDataWidget({
    super.key, required this.title, required this.data,
  });

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        SizedBox(width: 20),
        Text(data),
      ],
    );
  }
}