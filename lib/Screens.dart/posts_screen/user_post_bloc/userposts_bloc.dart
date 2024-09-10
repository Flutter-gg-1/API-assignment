import 'dart:async';
import 'package:api_assignment/models/post_model/post_model.dart';
import 'package:api_assignment/networking/networking_api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'userposts_event.dart';
part 'userposts_state.dart';

class UserPostsBloc extends Bloc<UserPostsEvent, UserPostsState> {
  final NetworkingApi api = NetworkingApi();
  List<PostModel> list = [];
  UserPostsBloc() : super(UserPostsInitial()) {
    on<UserPostsEvent>((event, emit) {});
    on<GetUserPostsEvent>(userPostsMethod);
  }
  FutureOr<void> userPostsMethod(
      GetUserPostsEvent event, Emitter<UserPostsState> emit) async {
    try {
      emit(LoadPostsState());
      list = await api.getAllUserPosts();
      emit(SuccessPostsState(posts: list));
    } catch (error) {
      emit(ErrorPostsState(msg: "Something wents wrong"));
    }
  }
}
