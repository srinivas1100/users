import '../models/user_model.dart';
import '../services/user_service.dart';

class UserRepository {
  final UserService userService;

  UserRepository({required this.userService});

  Future<List<UserModel>> getUsers(int page) async {
    final List<dynamic> userList = await userService.getUsers(page);
    return userList.map((userJson) => UserModel.fromJson(userJson)).toList();
  }

  Future<UserModel> getUserDetails(int userId) async {
    final Map<String, dynamic> userJson = await userService.getUserDetails(userId);
    return UserModel.fromJson(userJson);
  }
}
