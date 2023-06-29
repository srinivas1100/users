import 'package:flutter/material.dart';
import 'package:track_users/data/models/user_model.dart';

class UserListItem extends StatelessWidget {
  final UserModel user;
  final void Function(UserModel) onTap;

  const UserListItem({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.firstName),
      subtitle: Text(user.email),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatar),
      ),
      onTap: () => onTap(user),
    );
  }
}
