import 'package:api_test/screens/photos/photo_card.dart';
import 'package:flutter/material.dart';

import '../../networking/networking_api.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final networkApi = NetworkingApi();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('PHOTOS',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              _PageButtonsView(networkApi: networkApi),
              FutureBuilder(
                future: networkApi.fetchPhotos(),
                builder: (context, data) {
                  return Expanded(
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.6,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16),
                      children: networkApi.photos
                          .map((photo) => PhotoCard(photo: photo))
                          .toList(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PageButtonsView extends StatelessWidget {
  const _PageButtonsView({required this.networkApi});
  final NetworkingApi networkApi;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: networkApi.previous,
              child: const Text('Previous'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('${networkApi.start + 1}-${networkApi.limit}'),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: networkApi.next,
              child: const Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
