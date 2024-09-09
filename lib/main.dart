import 'package:api_assignment/widgets/custom_navigation.dart';
import 'package:api_assignment/services/setup.dart';
import 'package:flutter/material.dart';

void main() {
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomNavigation()
    );
  }
}
