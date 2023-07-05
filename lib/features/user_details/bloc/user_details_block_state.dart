part of 'user_details_block_bloc.dart';

abstract class UserDetailsBlockState {}

class UserDetailsBlockInitial extends UserDetailsBlockState {}

class UserDetailsBlockLoading extends UserDetailsBlockState {}

class UserDetailsBlockSuccess extends UserDetailsBlockState {
  final UsersDetails usersDetails;

  UserDetailsBlockSuccess(this.usersDetails);
}

class UserDetailsBlockFaild extends UserDetailsBlockState {
  final String error;

  UserDetailsBlockFaild(this.error);
}
