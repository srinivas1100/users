import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_users/domain/use_cases/get_user_details_use_case.dart';
import 'presentation/blocks/user_bloc.dart';
import 'data/repositories/user_repository.dart';
import 'data/services/user_service.dart';
import 'presentation/pages/user_list_screen.dart';

void main() {
  final UserService userService = UserService();
  final UserRepository userRepository =
      UserRepository(userService: userService);
  final UserBloc userBloc = UserBloc(
      getUsersUseCase: GetUsersUseCase(userRepository: userRepository));

  runApp(MyApp(userBloc: userBloc));
}

class MyApp extends StatelessWidget {
  final UserBloc userBloc;

  const MyApp({super.key, required this.userBloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<UserBloc>.value(
        value: userBloc,
        child: const UserListScreen(),
      ),
    );
  }
}
