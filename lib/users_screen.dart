import 'package:api_assignment/display_user.dart';
import 'package:api_assignment/networking/api_networking.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final api = ApiNetworking();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Users',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: FutureBuilder(
                future: api.getAllUsers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    final users = snapshot.data!;
                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return DisplayUser(user: user);
                      },
                    );
                  }
                  return const Center(child: Text('No data is found'));
                }),
          ),
        ));
  }
}
