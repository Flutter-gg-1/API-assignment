import 'package:api_assignment/models/photo_model.dart';
import 'package:api_assignment/models/post_model.dart';
import 'package:api_assignment/models/user_model.dart';
import 'package:api_assignment/networking/network_api.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final NetworkApi api = NetworkApi();
  List<UserModel> list = [];
  List<PhotoModel> photoList = [];
  List<PostModel> postList = [];
  UsersBloc() : super(UsersInitial()) {
    on<UsersEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetUserEvent>(
      (event, emit) async {
        try {
          print("i am here");

          list = await api.getCharacter();
          emit(ShowUserState(list));
        } catch (error) {
          emit(ErrorState(msg: "Sorry somthing is wrong"));
        }
      },
    );

    on<GetPhotoEvent>(
      (event, emit) async {
        try {
          emit(LoadingState()); // Emit a loading state
          photoList = await api.getPhoto();
          emit(ShowPhotoState(photoList));
        } catch (error) {
          emit(ErrorState(msg: "Failed to fetch photos"));
        }
      },
    );

    on<GetPostsEvent>(
      (event, emit) async {
        try {
          emit(LoadingState());
          postList = await api.getPosts();
          List<PostModel> filteredPosts =
              postList.where((post) => post.userId == 1).toList();
          emit(ShowPostState(filteredPosts));
        } catch (error) {
          print(error);
        }
      },
    );
  }
}
