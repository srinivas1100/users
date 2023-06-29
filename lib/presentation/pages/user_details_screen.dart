import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_users/presentation/blocks/user_bloc.dart';

class UserDetailsScreen extends StatelessWidget {
  final int userId;

  const UserDetailsScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title:const Text('User Details'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserDetailsLoadedState) {
            final userDetails = state.user;
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(userDetails.avatar),
                  ),
                  title: Text(userDetails.firstName),
                  subtitle: Text(userDetails.email),
                ),
                // Add more UI elements and animations as per your skills
              ],
            );
          } else {
            // _userBloc.add(event)
            // _userBloc.add(FetchUserDetails(userId));
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
