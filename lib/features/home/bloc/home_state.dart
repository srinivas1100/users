part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final List<UserModel>? userModel;

  const HomeState(this.userModel);
}

class HomeStateInitial extends HomeState {
  const HomeStateInitial(super.userModel);
}

class HomeStateLoading extends HomeState {
  const HomeStateLoading(super.userModel);
}

class HomeStateLoaded extends HomeState {
  final List<UserModel> userList;

  const HomeStateLoaded(super.userModel, this.userList);
}

class HomeStateError extends HomeState {
  final String error;

  const HomeStateError(super.userModel, this.error);
}

// class HomeStateLoaded extends HomeState {
//   final UsersList usersList;

//   HomeLoaded(this.usersList);
// }

// class HomeStateError extends HomeState {
//   final String error;

//   HomeError(this.error);
// }
