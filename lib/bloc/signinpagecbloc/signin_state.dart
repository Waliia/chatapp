part of 'signin_bloc.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}

class SigninLoadingState extends SigninState {}

class SigninLoadedState extends SigninState {
  User? user;
  SigninLoadedState(this.user);
}

class SigninErrorState extends SigninState {
  String errorMsg;
  SigninErrorState(this.errorMsg);
}
