import 'package:bloc/bloc.dart';
import 'package:chat_app1/webapis/firebase/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignUpBtnEvent>((event, emit) async {
      emit.call(SignupLoadingState());
      try {
        User? user = await signupWithEmailAndPassword(
            event.email, event.password, event.name);
        emit(SignupLoadedState(user));
      } on FirebaseAuthException catch (e) {
        emit.call(SignupErrorState(e.code));
      } catch (e) {
        emit.call(SignupErrorState(e.toString()));
      }
    });
  }
}
