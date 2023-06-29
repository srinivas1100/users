import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';

class GetUsersUseCase {
  final UserRepository userRepository;

  GetUsersUseCase({required this.userRepository});

  Future<List<UserModel>> getUsers(int page) async {
    return await userRepository.getUsers(page);
  }
}
