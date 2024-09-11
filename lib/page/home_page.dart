import 'dart:developer';

import 'package:api_asg/networking/api.dart';
import 'package:api_asg/widget/user_card_widget.dart';
import 'package:api_asg/widget/user_data_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Api'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'all users'),
              Tab(text: '10 photos'),
              Tab(text: 'userId = 1'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder(
              future: Api().getAllUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          snapshot.data!.length,
                          (index) {
                            return UserCardWidget(
                              userModel: snapshot.data![index],
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
            FutureBuilder(
              future: Api().getImg(),
              builder: (context, snapshot) {
                log("in fut");

                if (snapshot.hasData) {
                  log("in cound");

                  return SingleChildScrollView(
                    child: Column(
                        children: List.generate(
                      snapshot.data!.length,
                      (index) {
                        return CachedNetworkImage(
                          imageUrl: snapshot.data![index].url,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        );
                      },
                    )),
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          


            FutureBuilder(
              future: Api().getAllUser(userId: "1"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          snapshot.data!.length,
                          (index) {
                            return UserCardWidget(
                              userModel: snapshot.data![index],
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
