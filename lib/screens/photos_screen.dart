import 'dart:math';
import 'package:api_assignment/networking/api_networking.dart';
import 'package:api_assignment/services/setup.dart';
import 'package:flutter/material.dart';
import 'package:stacked_list_carousel/stacked_list_carousel.dart';

import '../models/photo.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final api = locator.get<ApiNetworking>();
    List<int> randomNumbersList = [];
    for (var i = 0; i < 9; i++) {
      randomNumbersList.add(Random().nextInt(4999));
    }
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: FutureBuilder(
            future: api.getAllPhotos(photosIndexes: randomNumbersList),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                return StackedListCarousel<Photo>(
                  items: snapshot.data!,
                  behavior: CarouselBehavior.loop,
                  cardBuilder: (context, item, size) {
                    return CircleAvatar(
                        radius: 80, backgroundImage: NetworkImage(item.url));
                  },
                  outermostCardHeightFactor: 0.6,
                  itemGapHeightFactor: 0.06,
                  maxDisplayedItemCount: 4,
                  animationDuration: const Duration(milliseconds: 20),
                  alignment: StackedListAxisAlignment.bottom,
                  autoSlideDuration: const Duration(minutes: 5),
                );
              }
              return const Center(child: Text('No data is found'));
            }),
      ),
    ));
  }
}
