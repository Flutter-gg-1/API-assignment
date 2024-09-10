import 'package:api_test/screens/photos/photo_bloc/photo_bloc.dart';
import 'package:api_test/screens/photos/photo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotoBloc()..add(PhotoLoadEvent()),
      child: Builder(builder: (context) {
        final bloc = context.read<PhotoBloc>();
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('PHOTOS',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  BlocBuilder<PhotoBloc, PhotoState>(
                    builder: (context, state) {
                      return (state is PhotoLoadState || bloc.photos.isEmpty)
                          ? const CircularProgressIndicator()
                          : Expanded(
                              child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.6,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                              ),
                              itemCount: bloc.photos.length,
                              itemBuilder: (BuildContext context, int index) {
                                final photo = bloc.photos[index];
                                return PhotoCard(photo: photo);
                              },
                            ));
                    },
                  ),
                  const _PageButtonsView(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _PageButtonsView extends StatelessWidget {
  const _PageButtonsView();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PhotoBloc>();
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, state) {
        return (state is PhotoLoadState || bloc.photos.isEmpty)
            ? const Text('')
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => bloc.add(PrevPageEvent()),
                        child: const Text('Previous'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child:
                          Text('${bloc.start + 1}-${bloc.start + bloc.limit}'),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => bloc.add(NextPageEvent()),
                        child: const Text('Next'),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
