import 'package:apiasswignment/bloc/pics_bloc.dart';
import 'package:apiasswignment/network/api_pics_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class PicsScreen extends StatelessWidget {
  PicsScreen({super.key});
  final futureApi = ApiPicsNetwork();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PicsBloc(futureApi)..add(GetPicsData()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Pics List'),
            ),
            body: BlocBuilder<PicsBloc, PicsState>(
              builder: (context, state) {
                if (state is PicsLoadingState) {
                  return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 150,
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: 100,
                                height: 10,
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 4),
                              Container(
                                width: 50,
                                height: 10,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is PicsloadedState) {
                  final pics = state.picss;
                  final itemCount = pics.length < 10 ? pics.length : 10;

                  return ListView.builder(
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      final pic = pics[index];
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            pic.thumbnailUrl != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      pic.url!,
                                      width: double.infinity,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Icon(Icons.image, size: 150),
                            const SizedBox(height: 8),
                            Text(
                              pic.title ?? 'No Title',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text('ID: ${pic.id}'),
                          ],
                        ),
                      );
                    },
                  );
                } else if (state is PicsErrorState) {
                  return Center(
                    child: Text('Error: ${state.message}'),
                  );
                } else {
                  return const Center(child: Text('No data found'));
                }
              },
            ),
          );
        },
      ),
    );
  }
}
