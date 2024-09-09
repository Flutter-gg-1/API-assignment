import 'package:api_assignment/models/post_model.dart';
import 'package:api_assignment/ui_constants/app_colors.dart';
import 'package:flutter/material.dart';

class UserPostsWidget extends StatelessWidget {
  final List<PostModel>? posts;
  const UserPostsWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts?.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: secondaryColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${index+1} )', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(posts![index].title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),),
                    Text(posts![index].body,style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),)
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}