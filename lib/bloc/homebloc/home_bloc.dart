import 'package:bloc/bloc.dart';
import 'package:chat_app1/webapis/firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../models/user_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) async {
      emit.call(HomeLoadingState());
      try {
        List<UserModel> users = await fetchUsers();
        if (users.isEmpty) {
          emit.call(EmptyState());
        } else {
          emit.call(HomeLoadedState(users));
        }
      } on FirebaseException catch (e) {
        emit(HomeErrorState(e.message!));
      } catch (e) {
        emit(HomeErrorState(e.toString()));
      }
    });
  }
}
