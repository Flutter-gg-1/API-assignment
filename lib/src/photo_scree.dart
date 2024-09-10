import 'package:api_project/bloc/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoScree extends StatelessWidget {
  const PhotoScree({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    TextEditingController controller = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: MediaQuery.of(context).size.height * 0.06),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                keyboardType: const TextInputType.numberWithOptions(),
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Enter photo quantity',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) =>
                    bloc.add(ShowPhotoEvent(quantity: int.parse(value))),
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is ShowPhotoSucessfullyState) {
                    return SingleChildScrollView(
                      child: Column(
                        children: state.photos
                            .map(
                              (e) => Column(
                                children: [
                                  Text('${e.id!}\n'),
                                  CachedNetworkImage(
                                  imageUrl: e.thumbnailUrl!,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                  errorWidget: (context, url, error) => Text(
                                      'Sorry photo with id ${e.id}is not available right now :('),
                                ),
                                const Divider()
                                ],
                              )
                            )
                            .toList(),
                      ),
                    );
                  }
                  return Center(
                      heightFactor: 8,
                      child: Text(
                          controller.text.isNotEmpty
                              ? 'Sorry there is no available\n photo right now :('
                              : 'Please fill the feild',
                          style: const TextStyle(fontSize: 20)));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
