import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import '../networking/networking_api.dart';
import '../widget/custom_photo_card.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final api = NetworkingApi();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 85, 30, 63),
        title: const Text(
          "Photos",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: api.getPhotos(),
        builder: (BuildContext context, dataFromMethod) {
          if (dataFromMethod.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (dataFromMethod.hasError) {
            return Center(child: Text("Error: ${dataFromMethod.error}"));
          }

          if (!dataFromMethod.hasData || dataFromMethod.data!.isEmpty) {
            return const Center(child: Text("No photos available"));
          }

          return StackedCardCarousel(
            items: dataFromMethod.data!.map((photo) {
              return CustomPhotoCard(
                image: Image.network(
                  photo.thumbnailUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.hide_image_rounded);
                  },
                ),
                title: photo.title,
                id: "Photo ID: ${photo.id.toString()}",
                albumId: "AlbumID: ${photo.albumId.toString()}",
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
