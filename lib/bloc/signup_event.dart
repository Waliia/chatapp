part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignUpBtnEvent extends SignupEvent {
  final String email;
  final String password;
  final String name;

  SignUpBtnEvent(this.name, this.password, this.email);
}
