import 'package:api_assignment/widgets/user_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe9efec),
      appBar: AppBar(
        backgroundColor: const Color(0xff16423c),
        title: const Text("Users Data App"),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text("Click on a user card to view their data", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return const UserCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
