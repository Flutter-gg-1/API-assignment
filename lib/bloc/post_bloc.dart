import 'package:apiasswignment/Models/Post.dart';
import 'package:apiasswignment/network/api_post_network.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostsBloc extends Bloc<PostEvent, PostState> {
  final ApiPostNetworking apiNetworking;

  PostsBloc(this.apiNetworking) : super(PostInitial()) {
    on<PostEvent>((event, emit) async {
      try {
        emit(PostLoadingState());
        final posts = await apiNetworking.getallPosts();
        emit(PostloadedState(posts: posts));
      } catch (e) {
        emit(PostErrorState(message: e.toString()));
      }
    });
  }
}