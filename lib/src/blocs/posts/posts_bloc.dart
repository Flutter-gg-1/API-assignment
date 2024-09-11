import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:train8/src/blocs/posts/posts_event.dart';
import 'package:train8/src/blocs/posts/posts_state.dart';
import 'package:train8/src/models/posts/post_model.dart';
import 'dart:convert';


class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<GetPostsEvent>(_onGetPosts);
  }

  Future<void> _onGetPosts(GetPostsEvent event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Post> posts = data.map((json) => Post.fromJson(json)).toList();
        emit(PostLoaded(posts));
      } else {
        emit(PostError('Failed to load posts'));
      }
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }
}
