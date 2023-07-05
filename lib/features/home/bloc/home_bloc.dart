import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:track_users/data/models/user_model.dart';
import 'package:track_users/data/models/users_list_model.dart';
import 'package:track_users/data/repositories/user_repository.dart';
import 'package:track_users/data/services/user_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeStateLoading([])) {
    on<HomeEventLoading>(homeEventLoading);
    // on<HomeLoadMore>(homeLoadMore);
  }
  Future<void> homeEventLoading(
      HomeEventLoading event, Emitter<HomeState> emit) async {
    emit(const HomeStateLoading([])); // Update state to loading

    try {
      UserRepository userRepository =
          UserRepository(userService: UserService());
      await userRepository.getUsers(event.page).then((value) {
        print(value.map((e) => e.toJson()).toList());
        emit(HomeStateLoaded(const [], value)); // Update state to loaded
      });
    } catch (e) {
      emit(HomeStateError([], e.toString())); // Update state to error
    }
  }

  // FutureOr<void> homeLoadMore(
  //     HomeLoadMore event, Emitter<HomeState> emit) async {
  //   UserRepository userRepository = UserRepository(userService: UserService());
  //   await userRepository.getUsers(event.page).then((val) {
  //     print(val.map((e) => e.toJson()).toList());
  //     emit(HomeStateLoaded(
  //         const [], [...state.userModel!, ...val])); // Update state to loaded
  //   });
  // }
}
