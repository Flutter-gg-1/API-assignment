import 'package:api_test/screens/users/user_card.dart';
import 'package:flutter/material.dart';
import 'package:api_test/networking/networking_api.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final networkApi = NetworkingApi();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('USERS',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              FutureBuilder(
                  future: networkApi.fetchUsers(),
                  builder: (context, data) {
                    return networkApi.users.isEmpty
                        ? const CircularProgressIndicator()
                        : Expanded(
                            child: ListView(
                                children: networkApi.users
                                    .map(
                                      (user) => InkWell(
                                        child: UserCard(user: user),
                                        onTap: () => (),
                                      ),
                                    )
                                    .toList()),
                          );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
