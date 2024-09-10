import 'package:api_assignment/models/user_model.dart';
import 'package:api_assignment/networking/network_api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final NetworkApi api = NetworkApi();
  List<UserModel> list = [];
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
  }
}
