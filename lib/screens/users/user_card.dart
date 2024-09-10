import 'package:flutter/material.dart';

import '../../model/user.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        surfaceTintColor: Colors.orange,
        elevation: 2,
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
              const Divider(),
              Text('Email: ${user.email}'),
              Text('Phone: ${user.phone}')
            ],
          ),
        ),
      ),
    );
  }
}
