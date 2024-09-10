import 'package:class_11/models/photos.dart';
import 'package:class_11/networking/api_network.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final x = ApiNetwork();
    var user = x.getTenPhotos();

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: user,
              builder: (context, AsyncSnapshot<List<Photos>> dataFromApi) {
                if (dataFromApi.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(color: Colors.red);
                } else if (dataFromApi.hasError) {
                  return Center(child: Text('Error: ${dataFromApi.error}'));
                } else if (!dataFromApi.hasData || dataFromApi.data!.isEmpty) {
                  return const Center(child: Text('No data available'));
                }
                return Column(
                    children: dataFromApi.data!
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color: Colors.yellowAccent, width: 5),
                                ),
                                child: Center(
                                    child: CachedNetworkImage(
                                  imageUrl: e.thumbnailUrl!,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const FaIcon(FontAwesomeIcons.faceSmile),
                                  fit: BoxFit.cover,
                                )),
                              ),
                            ))
                        .toList());
              }),
        ),
      ),
    ));
  }
}
