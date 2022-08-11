import 'package:bloc/bloc.dart';
import 'package:chat_app1/webapis/firebase/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<SigninClickEvent>((event, emit) async {
      emit(SigninLoadingState());
      try {
        User? user =
            await signinWithEmailAndPassword(event.email, event.passwrod);
        emit(SigninLoadedState(user));
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "ERROR_INVALID_EMAIL":
            var errorMessage = "Your email address appears to be malformed.";
            emit.call(SigninErrorState(errorMessage));
            break;
          case "ERROR_WRONG_PASSWORD":
            var errorMessage = "Your password is wrong.";
            emit.call(SigninErrorState(errorMessage));
            break;
          case "ERROR_USER_NOT_FOUND":
            var errorMessage = "User with this email doesn't exist.";
            emit.call(SigninErrorState(errorMessage));
            break;
          case "ERROR_USER_DISABLED":
            var errorMessage = "User with this email has been disabled.";
            emit.call(SigninErrorState(errorMessage));
            break;
          case "ERROR_TOO_MANY_REQUESTS":
            var errorMessage = "Too many requests. Try again later.";
            emit.call(SigninErrorState(errorMessage));
            break;
          case "user-not-found":
            var errorMessage = "there is no user with this email";
            emit.call(SigninErrorState(errorMessage));
            break;
          default:
            var errorMessage = "An undefined Error happened.";
            emit.call(SigninErrorState(errorMessage));
        }
      } catch (e) {
        emit.call(SigninErrorState('simple'));
      }
    });
  }
}
