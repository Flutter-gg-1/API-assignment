import 'package:api_flutter/model/post_model.dart';
import 'package:api_flutter/networking/network_api.dart';
import 'package:api_flutter/widget/custome_byid,dart';
import 'package:api_flutter/widget/custome_photos.dart';
import 'package:api_flutter/widget/custome_users_data.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final api = NetworkingApi();
  PostModel? post;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('API Data'),
          bottom: const TabBar(tabs: [
            Tab(
              text: 'allUsers',
            ),
            Tab(
              text: 'photos',
            ),
            Tab(
              text: 'byID',
            )
          ]),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Expanded(
              // Add Expanded here
              child: TabBarView(
                children: [
                  CustomeUsers(api: api),
                  CustomePhotos(api: api),
                  CustomePostById(
                    index: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
