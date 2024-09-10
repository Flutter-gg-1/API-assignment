import 'package:api_app/screen/tabbar_screen.dart';
import 'package:api_app/screen/users_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TabbarScreen());
  }
}
