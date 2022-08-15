part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  const HomeState();
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<UserModel> users;
  const HomeLoadedState(this.users);
}

class HomeErrorState extends HomeState {
  final String errorMsg;
  const HomeErrorState(this.errorMsg);
}

class EmptyState extends HomeState {}
