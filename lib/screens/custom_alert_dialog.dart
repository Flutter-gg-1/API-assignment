import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key, required this.content});
  final String content;

  void dismiss(BuildContext context) => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Oops',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Text(content, style: TextStyle(fontSize: 16)),
      ),
      actions: <Widget>[
        ElevatedButton(onPressed: () => dismiss(context), child: Text('OK'))
      ],
    );
  }
}
