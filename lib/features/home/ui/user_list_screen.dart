import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_users/data/models/user_model.dart';
import 'package:track_users/features/home/bloc/home_bloc.dart';
import 'package:track_users/features/user_details/ui/user_details_screen.dart';
import '../../../widgets/user_list_item.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeEventLoading(_currentPage));
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //     _currentPage++;
    //     print(_currentPage);
    //     context.read<HomeBloc>().add(HomeLoadMore(_currentPage));
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User List'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeStateLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeStateError) {
              return Center(
                child: Text(state.error),
              );
            }
            if (state is HomeStateLoaded) {
              final List<UserModel> users = state.userList;
              return ListView.builder(
                controller: _scrollController,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final UserModel user = users[index];
                  return UserListItem(
                    user: user,
                    onTap: () => _navigateToUserDetails(user.id!),
                  );
                },
              );
            }

            return const Center(
              child: Text("Somthing wen't wrong"),
            );
          },
        ));
  }

  void _navigateToUserDetails(int userId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => UserDetailsScreen(
          userId: userId,
        ),
      ),
    );
  }
}
