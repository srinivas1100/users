import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_users/data/models/user_model.dart';
import 'package:track_users/data/repositories/user_repository.dart';
import 'package:track_users/data/services/user_service.dart';
import 'package:track_users/domain/use_cases/get_user_details_use_case.dart';
import 'package:track_users/presentation/blocks/user_bloc.dart';
import 'package:track_users/presentation/pages/user_details_screen.dart';
import '../../presentation/widgets/user_list_item.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final UserBloc _userBloc = UserBloc(
      getUsersUseCase: GetUsersUseCase(
          userRepository: UserRepository(userService: UserService())));
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    // _userBloc.add(FetchUsersEvent(_currentPage));

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _currentPage++;
        _userBloc.add(FetchUsersEvent(_currentPage));
      }
    });
  }

  @override
  void dispose() {
    _userBloc.close();
    _scrollController.dispose();
    super.dispose();
  }

  void _navigateToUserDetails(UserModel user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailsScreen(userId: user.id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        bloc: _userBloc,
        builder: (context, state) {
          if (state is UsersLoadedState) {
            final List<UserModel> users = state.users;
            return ListView.builder(
              controller: _scrollController,
              itemCount: users.length,
              itemBuilder: (context, index) {
                final UserModel user = users[index];
                return UserListItem(
                  user: user,
                  onTap: (u) => _navigateToUserDetails(user),
                );
              },
            );
          } else if (state is UserErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
