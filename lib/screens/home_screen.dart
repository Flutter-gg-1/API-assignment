import 'package:api_test/networking/networking_api.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final networkApi = NetworkingApi();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: FutureBuilder(
              future: networkApi.fetchUsers(),
              builder: (context, data) {
                return ListView(
                    children: networkApi.users
                        .map((user) => UserCard(user: user))
                        .toList());
              }),
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(user.name),
                Text('ID: ${user.id.toString()}'),
              ],
            ),
            Divider(),
            Text('Email: ${user.email}'),
            Text('Phone: ${user.phone}')
          ],
        ),
      ),
    );
  }
}
