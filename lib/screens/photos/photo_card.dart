import 'package:flutter/material.dart';
import '../../model/photo.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({super.key, required this.photo});
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(radius: 12, child: Text(photo.id.toString())),
                CircleAvatar(radius: 8, child: Text('${photo.albumId}'))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(photo.url, fit: BoxFit.cover)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ID: ${photo.title}',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
