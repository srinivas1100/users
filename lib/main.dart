import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_users/features/home/bloc/home_bloc.dart';
import 'package:track_users/features/user_details/ui/user_details_screen.dart';

import 'features/user_details/bloc/user_details_block_bloc.dart';
import 'features/home/ui/user_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()),
        BlocProvider(create: (_) => UserDetailsBlockBloc()),
      ],
      child: MaterialApp(
        title: 'User App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/": (context) => const UserListScreen(),
          "/userDetails": (context) => const UserDetailsScreen(),
        },
        initialRoute: "/",
      ),
    );
  }
}
