import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/post.dart';
import '../../../networking/networking_api.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final nwk = NetworkingApi();
  List<Post> posts = [];
  int? userId = 1;

  PostBloc() : super(PostInitial()) {
    on<PostLoadEvent>(loadData);
  }

  Future<void> loadData(PostLoadEvent event, Emitter<PostState> emit) async {
    userId = userId;
    if (userId != 1) {
      emit(PostErrorState(
          msg: 'You do not have permission to view user id $userId posts'));
    } else {
      try {
        posts = await nwk.fetchPosts(params: getPostsParams());
        emit(PostSuccessState());
      } catch (e) {
        emit(PostErrorState(msg: 'There was an error fetching posts\n$e'));
      }
    }
  }

  String getPostsParams() {
    return userId == null ? '' : '?userId=$userId';
  }
}
