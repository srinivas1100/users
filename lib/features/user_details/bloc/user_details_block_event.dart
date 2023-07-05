part of 'user_details_block_bloc.dart';

abstract class UserDetailsBlockEvent {}

class LoadingUserDetailsEvet extends UserDetailsBlockEvent {
  final int userId;

  LoadingUserDetailsEvet(this.userId);
}
