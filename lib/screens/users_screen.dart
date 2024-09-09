import 'package:api_assignment/widgets/display_user.dart';
import 'package:api_assignment/networking/api_networking.dart';
import 'package:api_assignment/services/setup.dart';
import 'package:flutter/material.dart';


class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final api = locator.get<ApiNetworking>();
    return Scaffold(
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
