part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class SigninClickEvent extends SigninEvent {
  String email;
  String passwrod;
  SigninClickEvent(this.email, this.passwrod);
}
