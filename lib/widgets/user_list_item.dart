import 'package:flutter/material.dart';
import 'package:track_users/data/models/user_model.dart';

class UserListItem extends StatelessWidget {
  final UserModel user;
  final void Function() onTap;

  const UserListItem({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(user.avatar!),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("First Name : ${user.firstName!}"),
                    Text("Last Name : ${user.lastName!}"),
                    Text("Email : ${user.email}"),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
