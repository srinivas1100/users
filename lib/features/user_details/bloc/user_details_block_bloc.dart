import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:track_users/data/models/user_details_model.dart';
import 'package:track_users/data/services/user_service.dart';
import 'package:track_users/domain/repositories/user_repository.dart';

part 'user_details_block_event.dart';
part 'user_details_block_state.dart';

class UserDetailsBlockBloc
    extends Bloc<UserDetailsBlockEvent, UserDetailsBlockState> {
  UserDetailsBlockBloc() : super(UserDetailsBlockInitial()) {
    on<LoadingUserDetailsEvet>(userDetailsBlockEvent);
  }

  FutureOr<void> userDetailsBlockEvent(
      LoadingUserDetailsEvet event, Emitter<UserDetailsBlockState> emit) async {
    emit(UserDetailsBlockLoading());
    try {
      UserRepository userRepository =
          UserRepository(userService: UserService());
      UsersDetails usersDetails =
          await userRepository.getUserDetails(event.userId);
      emit(UserDetailsBlockSuccess(usersDetails));
    } catch (e) {
      emit(UserDetailsBlockFaild(e.toString()));
    }
  }
}
