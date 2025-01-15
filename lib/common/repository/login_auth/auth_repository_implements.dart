import 'package:flutter_auth_cubits/common/entity/user.dart';
import 'package:flutter_auth_cubits/common/repository/login_auth/auth_repository.dart';
import 'package:flutter_auth_cubits/common/service/auth_api_service.dart';

class AuthRepositoryImplements extends AuthRepository {
  final AuthApiService authService;

  AuthRepositoryImplements({required this.authService});

  @override
  Future<User> login(String username, String password) async {
    return await authService.login(username, password);
  }
}
