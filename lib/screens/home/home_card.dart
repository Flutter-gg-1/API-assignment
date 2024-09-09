import 'package:flutter/material.dart';
import '../photos/photos_screen.dart';
import '../posts/posts_screen.dart';
import '../users/users_screen.dart';

class HomeCardView extends StatelessWidget {
  const HomeCardView({super.key, required this.homeCard});
  final HomeCardValues homeCard;

  void _navigate(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => homeCard.destination()));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigate(context),
      child: Card(
        elevation: 4,
        child: Center(
          child: Text(
            homeCard.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

enum HomeCardValues { users, posts, photos }

extension NavDest on HomeCardValues {
  Widget destination() {
    switch (this) {
      case HomeCardValues.users:
        return const UsersScreen();
      case HomeCardValues.posts:
        return const PostsScreen();
      case HomeCardValues.photos:
        return const PhotosScreen();
    }
  }
}
