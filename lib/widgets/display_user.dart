import 'dart:math';
import 'package:api_assignment/widgets/display_user_details.dart';
import 'package:api_assignment/models/user%20model/user.dart';
import 'package:flutter/material.dart';

class DisplayUser extends StatelessWidget {
  final User user;
  const DisplayUser({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
                transform: const GradientRotation(pi / 4),
                colors: [
                  Colors.blue.shade100,
                  Colors.grey.withOpacity(0.1),
                  Colors.blue.shade100,
                ])),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              DisplayUserDetails(
                label: 'ID',
                details: '${user.id}',
                isId: true,
              ),
              DisplayUserDetails(
                label: 'Name',
                details: user.name,
              ),
              DisplayUserDetails(
                label: 'Username',
                details: user.username,
              ),
              DisplayUserDetails(
                label: 'Email',
                details: user.email,
              ),
              DisplayUserDetails(
                label: 'Address',
                details: user.address.toString(),
              ),
              DisplayUserDetails(
                label: 'Phone',
                details: user.phone,
              ),
              DisplayUserDetails(
                label: 'Website',
                details: user.website,
              ),
              DisplayUserDetails(
                label: 'Company',
                details: user.company.toString(),
              ),
            ]),
      ),
    );
  }
}
