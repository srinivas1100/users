import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_users/data/models/user_model.dart';
import 'package:track_users/domain/use_cases/get_user_details_use_case.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/use_cases/get_users_use_case.dart';

class UserEvent {}

class FetchUsersEvent extends UserEvent {
  final int page;

  FetchUsersEvent(this.page);
}

class FetchUserEvent extends UserEvent {
  final int userId;

  FetchUserEvent(this.userId);
}

class UserState {}

class UserInitialState extends UserState {}

class UsersLoadedState extends UserState {
  final List<UserModel> users;

  UsersLoadedState(this.users);
}

class UserDetailsLoadedState extends UserState {
  final UserModel user;

  UserDetailsLoadedState(this.user);
}

class UserErrorState extends UserState {
  final String errorMessage;

  UserErrorState(this.errorMessage);
}

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUseCase? getUsersUseCase;
  final GetUserUseCase? getUserUseCase;

  UserBloc({required this.getUsersUseCase, this.getUserUseCase})
      : super(UserInitialState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUsersEvent) {
      yield* _mapFetchUsersEventToState(event.page);
    } else if (event is FetchUserEvent) {
      yield* _mapFetchUserEventToState(event.userId);
    }
  }

  Stream<UserState> _mapFetchUsersEventToState(int page) async* {
    try {
      final users = await getUsersUseCase!.getUsers(page);
      yield UsersLoadedState(users);
    } catch (e) {
      yield UserErrorState('Failed to load users');
    }
  }

  Stream<UserState> _mapFetchUserEventToState(int userId) async* {
    try {
      final user = await getUserUseCase!.getUser(userId);
      yield UserDetailsLoadedState(user);
    } catch (e) {
      yield UserErrorState('Failed to load user details');
    }
  }
}
