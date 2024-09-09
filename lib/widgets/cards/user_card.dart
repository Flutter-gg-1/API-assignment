import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard(
      {super.key, required this.userName, required this.name, this.onTap});
  final String userName;
  final String name;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(18),
        width: MediaQuery.of(context).size.width / 1.10,
        height: MediaQuery.of(context).size.height / 8,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 195, 202, 206),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Username: $userName", style: const TextStyle(fontSize: 16)),
            Text("Name: $name",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
