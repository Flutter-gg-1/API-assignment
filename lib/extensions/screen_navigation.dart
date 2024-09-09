import 'package:flutter/material.dart';

extension ScreenNavigation on BuildContext {
  push({required Widget to}) {
    Navigator.push(this, MaterialPageRoute(builder: (context)=>to));
  }
}