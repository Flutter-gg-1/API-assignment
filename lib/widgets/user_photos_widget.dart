import 'package:api_assignment/extensions/screen_size.dart';
import 'package:api_assignment/models/photo_model.dart';
import 'package:api_assignment/ui_constants/app_colors.dart';
import 'package:flutter/material.dart';

class UserPhotosWidget extends StatelessWidget {
  final List<PhotoModel>? photos;
  const UserPhotosWidget({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: context.getWidth(),
          height: context.getHeight(divideBy: 1.3),
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: PageView.builder(
            itemCount: photos?.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text('Album : ${photos![index].albumId}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: mainColor),),
                  ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network(photos![index].url)),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Photo ${index+1} : ${photos![index].title}')
                  ),
                ]
              );
            },
          ),
        ),
      ],
    );
  }
}