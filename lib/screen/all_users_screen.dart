import 'package:api/network/network_api.dart';
import 'package:flutter/material.dart';

class AllUsersScreen extends StatefulWidget {
  const AllUsersScreen({super.key});

  @override
  State<AllUsersScreen> createState() => _AllUsersScreen();
}

class _AllUsersScreen extends State<AllUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: NetworkApi().getAllUser(),
              builder: (context, requred) {
                if (requred.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (requred.hasData) {
                  final users = requred.data;
                  return ListView.builder(
                      itemCount: users?.length,
                      itemBuilder: (context, index) {
                        return Text("${users?[index].name}");
                      });
                }
                return const Text("error");
              })),
    );
  }
}
