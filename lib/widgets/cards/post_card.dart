import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.title, required this.content});
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: kElevationToShadow[2],
      ),
      child: ListTile(
        title: Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(content),
      ),
    );
    ;
  }
}
