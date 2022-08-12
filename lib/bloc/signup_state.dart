part of 'signup_bloc.dart';

@immutable
abstract class SignupState {
  const SignupState();
}

class SignupInitial extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupLoadedState extends SignupState {
  final User? user;
  const SignupLoadedState(this.user);
}

class SignupErrorState extends SignupState {
  final String message;
  const SignupErrorState(this.message);
}
