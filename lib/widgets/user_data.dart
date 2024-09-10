import 'package:api_assignment/models/users_model/user_model.dart';
import 'package:flutter/material.dart';

class UserDataWidget extends StatelessWidget {
  final UserModel user;
  const UserDataWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 450,
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        color: const Color.fromARGB(255, 245, 237, 209),
        child: ListTile(
          title: Text(
            user.name,
            style: const TextStyle(
                color: Color.fromARGB(255, 255, 191, 0),
                fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ID: ${user.id}"),
              Text("Username: ${user.username}"),
              Text("Email: ${user.email}"),
              Text("Phone: ${user.phone}"),
              Text("Website: ${user.website}"),
              const Text(
                "\nAddress:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Street: ${user.address.street}"),
              Text("suite: ${user.address.suite}"),
              Text("city: ${user.address.city}"),
              Text("zipcode: ${user.address.zipcode}"),
              Text("geo lat:${user.address.geo.lat}"),
              Text("geo lng:${user.address.geo.lng}"),
              const Text(
                "\nCompany:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("name: ${user.company.name}"),
              Text("catchPhrase: ${user.company.catchPhrase}"),
              Text("bs: ${user.company.bs}"),
            ],
          ),
        ));
  }
}
