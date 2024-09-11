import 'package:api_assignment/bloc/phto_bloc/Photos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotosBloc(),
      child: Builder(builder: (context) {
        final bloc = BlocProvider.of<PhotosBloc>(context);
        bloc.add(ShowPhotosByUserIdEvent());
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 160, 138, 71),
          body: BlocBuilder<PhotosBloc, PhotosState>(
            builder: (context, state) {
              if (state is ShowPhotosByUserIdState) {
                return ListView(
                    children: List.generate(
                  bloc.api.allPhotos.length,
                  (index) => Card(
                    child: Image.network(bloc.api.allPhotos[index].url),
                  ),
                ));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        );
      }),
    );
  }
}
