import 'package:api_lab/networking/network_api.dart';
import 'package:api_lab/widgets/cards/user_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final networkApi = NetworkApi();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        title: const Text("Users"),
      ),
      body: FutureBuilder(
          future: networkApi.getAllUsers(),
          builder: (context, user) {
            if (user.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return UserCard(
                    userName: user.data?[index].username ?? "",
                    name: user.data?[index].name ?? "");
              },
            );
          }),
    );
  }
}
