import '../entity/user.dart';
import '../service/auth_api_service.dart';
import 'auth_repository.dart';

class AuthRepositoryImplements extends AuthRepository {
  final AuthApiService authService;

  AuthRepositoryImplements({required this.authService});

  @override
  Future<User> login(String username, String password) async {
    return await authService.login(username, password);
  }
}
