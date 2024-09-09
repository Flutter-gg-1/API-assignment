import 'dart:math';

import 'package:flutter/material.dart';
import '../models/post.dart';

class DisplayPosts extends StatelessWidget {
  final Post post;
  const DisplayPosts({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
                transform: const GradientRotation(pi / 4),
                colors: [
                  Colors.orange.shade100,
                  Colors.grey.withOpacity(0.1),
                  Colors.orange.shade100,
                ])),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Title: ',style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Flexible(child: Text(post.title, style: const TextStyle(fontStyle: FontStyle.italic),))
                ],
              ),
              const SizedBox(
                height: 5,
              ),
             Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Body: ',style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Flexible(child: Text(post.body, style: const TextStyle(fontStyle: FontStyle.italic),))
                ],
              ),
            ]),
      ),
    );
  }
}
