import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository userRepository;

  GetUserUseCase({required this.userRepository});

  Future<UserModel> getUser(int userId) async {
    return await userRepository.getUserDetails(userId);
  }
}
