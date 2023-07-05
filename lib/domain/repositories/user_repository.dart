import 'package:track_users/data/models/user_details_model.dart';
import 'package:track_users/data/models/user_model.dart';
import 'package:track_users/data/services/user_service.dart';

class UserRepository {
  final UserService userService;

  UserRepository({required this.userService});

  Future<List<UserModel>> getUsers(int page) async {
    final List<dynamic> userList = await userService.getUsers(page);
    return userList.map((userJson) => UserModel.fromJson(userJson)).toList();
  }

  Future<UsersDetails> getUserDetails(int userId) async {
    final Map<String, dynamic> userJson =
        await userService.getUserDetails(userId);
    print(userJson);
    return UsersDetails.fromJson(userJson);
  }
}
