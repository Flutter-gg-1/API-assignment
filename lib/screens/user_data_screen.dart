import 'package:api_assignment/models/user_model.dart';
import 'package:api_assignment/services/api_networking.dart';
import 'package:api_assignment/ui_constants/app_colors.dart';
import 'package:api_assignment/widgets/loading_indicator_widget.dart';
import 'package:api_assignment/widgets/user_photos_widget.dart';
import 'package:api_assignment/widgets/user_posts_widget.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatelessWidget {
  final UserModel? user;
  const UserDataScreen({super.key, this.user});

  @override
  Widget build(BuildContext context) {
              final api = ApiNetworking();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: mainColor,
          foregroundColor: Colors.white,
          title: Text("${user?.name.split(' ').last}'s Data"),
          titleTextStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.transparent,
            unselectedLabelColor: Colors.white30,
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            labelPadding: EdgeInsets.symmetric(vertical: 10),
            tabs: [
              Text("Posts", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              Text("Photos", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600))
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              FutureBuilder(
                future: api.getUserPosts(userId: user!.id),
                builder: (context, response) {
                  if(response.connectionState == ConnectionState.done) {
                    if(response.hasData==false) {
                      return Center(child: Text("No Posts Found", style: TextStyle(color: mainColor)));
                    }
                    else {
                      return UserPostsWidget(posts: response.data);
                    }
                  }
                  return const LoadingIndicatorWidget(text: "Loading Posts ....");
      }
    ),
              UserPhotosWidget(user: user!),
            ],
          ),
        ),
      ),
    );
  }
}