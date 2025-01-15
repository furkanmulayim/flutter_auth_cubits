import '../../entity/user.dart';

abstract class AuthRepository {
  Future<User> login(String username, String password);
}
