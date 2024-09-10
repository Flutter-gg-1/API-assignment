import 'dart:math';

import 'package:class_11/models/albums.dart';
import 'package:class_11/models/photos.dart';
import 'package:class_11/models/users_model.dart';
import 'package:class_11/networking/api_network.dart';
import 'package:flutter/material.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final x = ApiNetwork();
    var user = x.getAlbumByUserId();

    return Scaffold(
        appBar: AppBar(centerTitle: true,
          title: const GradientText(
            "UserId 1",
            style:  TextStyle(fontSize: 35),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: FutureBuilder(
                  future: user,
                  builder:
                      (context, AsyncSnapshot<List<AlbumsModel>> dataFromApi) {
                    if (dataFromApi.connectionState ==
                        ConnectionState.waiting) {
                      return const CircularProgressIndicator(color: Colors.red);
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
                                          color: Colors.blueAccent, width: 5),
                                    ),
                                    child: Center(
                                        child: Text(
                                      e.title!,
                                      textAlign: TextAlign.center,
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

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const GradientText(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Colors.blue, Colors.purple],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: Text(
        text,
        style: style?.copyWith(color: Colors.white) ??
            const TextStyle(color: Colors.white),
      ),
    );
  }
}
