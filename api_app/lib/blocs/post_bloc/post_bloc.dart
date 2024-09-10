import 'dart:async';

import 'package:api_app/model/post_model.dart';
import 'package:api_app/networking/api_networking.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  List<PostModel> listPost = [];
  final getOneUserPosts = ApiNetworking().getOneUserPosts(id: 1);
  PostBloc() : super(PostInitial()) {
    on<PostEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadPostEvent>(postEvent);
  }

  FutureOr<void> postEvent(LoadPostEvent event, Emitter<PostState> emit) async {
    try {
      emit(LoadPostState());
      listPost = await getOneUserPosts;
      emit(SuccessPostState(listPosts: listPost));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
