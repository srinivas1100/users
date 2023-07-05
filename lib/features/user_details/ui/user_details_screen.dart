import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_users/features/user_details/bloc/user_details_block_bloc.dart';

class UserDetailsScreen extends StatefulWidget {
  final int? userId;

  const UserDetailsScreen({
    super.key,
    this.userId,
  });

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<UserDetailsBlockBloc>()
        .add(LoadingUserDetailsEvet(widget.userId!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: BlocBuilder<UserDetailsBlockBloc, UserDetailsBlockState>(
        builder: (cont, state) {
          if (state is UserDetailsBlockSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          NetworkImage(state.usersDetails.userModel!.avatar!),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${state.usersDetails.userModel!.firstName!} ${state.usersDetails.userModel!.firstName!}",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      state.usersDetails.userModel!.email!,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      state.usersDetails.support!.url!,
                    ),
                    Text(
                      state.usersDetails.support!.text!,
                    ),

                    // Add more UI elements and animations as per your skills
                  ],
                ),
              ),
            );
          } else if (state is UserDetailsBlockLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserDetailsBlockFaild) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
