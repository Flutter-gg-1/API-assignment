import 'package:api_project/model/photo_model.dart';
import 'package:api_project/model/post_model.dart';
import 'package:api_project/model/user_model.dart';
import 'package:api_project/networking/networking_api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final api = NetworkingApi();
  List<UserModel> users = [];
  List<PhotoModel> photos = [];
  late PostModel posts;
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<ShowUserEvent>((event, emit) async {
      try {
        emit(LoadingState());
        users = await api.getAllUser();
        emit(ShowUserSucessfullyState(users: users));
      } catch (erorr) {
        emit(ErrorState(msg: '$erorr'));
      }
    });
    on<ShowPhotoEvent>((event, emit) async{
            try {
        emit(LoadingState());
        photos = await api.getOnlyCustomQuantityOfPhoto(quantity: event.quantity);
        emit(ShowPhotoSucessfullyState(photos: photos));
      } catch (erorr) {
        emit(ErrorState(msg: '$erorr'));
      }
    });
    on<ShowPostEvent>((event, emit) async{
            try {
        emit(LoadingState());
        posts = await api.getPost(id: event.id);
        emit(ShowPostSucessfullyState(posts: posts));
      } catch (erorr) {
        emit(ErrorState(msg: '$erorr'));
      }
    });
  }
}
