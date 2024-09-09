import 'package:flutter/material.dart';

class DisplayUserDetails extends StatelessWidget {
  final String label;
  final String details;
  const DisplayUserDetails(
      {super.key, required this.label, required this.details});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Flexible(
            child: Text(
          details,
          style: const TextStyle(fontStyle: FontStyle.italic),
        )),
      ],
    );
  }
}
